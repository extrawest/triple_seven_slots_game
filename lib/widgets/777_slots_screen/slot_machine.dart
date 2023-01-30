import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roll_slot_machine/roll_slot_controller.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/bloc/spin_wheel_cubit/spin_wheel_cubit.dart';
import 'package:triple_seven_slots_game/bloc/user_balance_cubit/user_balance_cubit.dart';
import 'package:triple_seven_slots_game/models/lottie_type.dart';
import 'package:triple_seven_slots_game/models/prize.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/coins_lottie.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/common_roll_slot.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/control_panel.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/jackpot_spin_wheel.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/prize_dialog.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/user_balance.dart';
import 'package:triple_seven_slots_game/widgets/common/common_lottie.dart';

const _coinsDurationSeconds = 2;

class SlotMachine extends StatefulWidget {
  const SlotMachine({Key? key}) : super(key: key);

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> with TickerProviderStateMixin {
  final RollSlotController _firstController = RollSlotController(secondsBeforeStop: 2);
  final RollSlotController _secondController = RollSlotController(secondsBeforeStop: 2);
  final RollSlotController _thirdController = RollSlotController(secondsBeforeStop: 2);

  late final AnimationController _confettiLottieController;
  late final AnimationController _goldenLottieController;
  late final AnimationController _coinsLottieController;

  @override
  void initState() {
    _confettiLottieController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _goldenLottieController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _coinsLottieController =
        AnimationController(vsync: this, duration: const Duration(seconds: _coinsDurationSeconds));
    listenSlotController();
    super.initState();
  }

  void listenSlotController() {
    // fourth controller will always stop after others
    _thirdController.addListener(() {
      if (_thirdController.state.isStopped) {
        Future.delayed(const Duration(seconds: 2)).then((_) {
          context.read<SlotMachineBloc>().add(const StopMachine());
        });
      }
    });
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SlotMachineBloc, SlotMachineState>(
          listenWhen: (prev, curr) => prev.isSpinning != curr.isSpinning,
          listener: _slotMachineListener,
        ),
        BlocListener<SlotMachineBloc, SlotMachineState>(
          listenWhen: (prev, curr) => prev.isSpinning != curr.isSpinning,
          listener: _prizeListener,
        ),
      ],
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: AbsorbPointer(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        boardIc,
                        width: 750,
                        height: 260,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 300,
                        height: 250,
                        child: Column(
                          children: [
                            const UserBalance(),
                            const SizedBox(height: 20),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 24.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: _buildRollSlots(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const ControlPanel(),
            ],
          ),
          CoinsLottie(animationController: _coinsLottieController),
        ],
      ),
    );
  }

  Widget _buildLottie(LottieType lottieType) {
    return lottieType.isConfetti
        ? CommonLottie(
            lottieController: _confettiLottieController,
            lottie: confettiLottie,
          )
        : CommonLottie(
            lottieController: _goldenLottieController,
            lottie: goldenConfettiLottie,
          );
  }

  List<Widget> _buildRollSlots() {
    return [
      Flexible(
        child: CommonRollSlot(
          controller: _firstController,
          itemExtend: 50,
          prizes: prizes,
        ),
      ),
      Flexible(
        child: CommonRollSlot(
          controller: _secondController,
          itemExtend: 50,
          prizes: prizes,
        ),
      ),
      Flexible(
        child: CommonRollSlot(
          controller: _thirdController,
          itemExtend: 50,
          prizes: prizes,
        ),
      ),
    ];
  }

  void _slotMachineListener(BuildContext context, SlotMachineState state) {
    if (state.isSpinning) {
      _triggerControllers(state.prizeIndexes);
    } else {
      _firstController.stop();
      _secondController.stop();
      _thirdController.stop();
    }
  }

  void _prizeListener(BuildContext context, SlotMachineState state) {
    if (state.isSpinning == false && state.prize != null) {
      if (state.prize!.prizeType.isSeventh) {
        context.read<SpinWheelCubit>().setIsJackpotWheelComplete(false);
        _showJackpotDialog(context, state.currentBet);
      } else {
        _showPrizeDialog(context, state);
      }
    }
  }

  void _showJackpotDialog(BuildContext context, int bet) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Center(
        child: JackpotSpinWheel(bet: bet),
      ),
    ).then((_) async {
      _coinsLottieController.forward().then((_) => _coinsLottieController.reset());
    });
  }

  void _showPrizeDialog(BuildContext context, SlotMachineState state) {
    showDialog(
      context: context,
      builder: (_) => Stack(
        children: [
          Center(
            child: PrizeDialog(prize: state.prize!),
          ),
          _buildLottie(state.prize!.lottieType),
        ],
      ),
    ).then((_) async {
      _coinsLottieController.forward().then((_) => _coinsLottieController.reset());
      await Future.delayed(const Duration(seconds: _coinsDurationSeconds ~/ 2));
      context
          .read<UserBalanceCubit>()
          .updateUserBalance(state.prize!.multiplier * state.currentBet);
    });
    _playLottie(state.prize!.lottieType);
  }

  void _triggerControllers(List<int> prizeIndexes) async {
    _firstController.animateRandomly(index: prizeIndexes[0]);
    await Future.delayed(const Duration(milliseconds: 100));
    _secondController.animateRandomly(index: prizeIndexes[1]);
    await Future.delayed(const Duration(milliseconds: 100));
    _thirdController.animateRandomly(index: prizeIndexes[2]);
  }

  void _playLottie(LottieType lottieType) {
    if (lottieType.isConfetti) {
      _confettiLottieController.forward().then((_) => _confettiLottieController.reset());
    } else if (lottieType.isGoldenConfetti) {
      _goldenLottieController.forward().then((_) => _goldenLottieController.reset());
    }
  }

  void disposeControllers() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _goldenLottieController.dispose();
    _confettiLottieController.dispose();
    _coinsLottieController.dispose();
  }

  final List<Widget> prizes = <Widget>[
    Center(child: SvgPicture.asset(seventhIc)),
    Center(child: SvgPicture.asset(cherryIc)),
    Center(child: SvgPicture.asset(appleIc)),
    Center(child: SvgPicture.asset(crownIc)),
    Center(child: SvgPicture.asset(barIc)),
    Center(child: SvgPicture.asset(coinIc)),
    Center(child: SvgPicture.asset(lemonIc)),
    Center(child: SvgPicture.asset(watermelonIc)),
  ];
}
