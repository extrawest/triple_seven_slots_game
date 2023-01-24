import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:roll_slot_machine/roll_slot_controller.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/bloc/slot_machine_bloc/slot_machine_bloc.dart';
import 'package:triple_seven_slots_game/models/lottie_type.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/common_roll_slot.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/control_panel.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/prize_dialog.dart';
import 'package:triple_seven_slots_game/widgets/common/common_lottie.dart';

class SlotMachine extends StatefulWidget {
  const SlotMachine({Key? key}) : super(key: key);

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> with TickerProviderStateMixin {
  final RollSlotController _firstController = RollSlotController(secondsBeforeStop: 2);
  final RollSlotController _secondController = RollSlotController(secondsBeforeStop: 2);
  final RollSlotController _thirdController = RollSlotController(secondsBeforeStop: 2);
  final RollSlotController _fourthController = RollSlotController(secondsBeforeStop: 2);

  late final AnimationController _confettiLottieController;
  late final AnimationController _goldenLottieController;

  @override
  void initState() {
    _confettiLottieController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _goldenLottieController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    listenSlotController();
    super.initState();
  }

  void listenSlotController() {
    // fourth controller will always stop after others
    _fourthController.addListener(() {
      if (_fourthController.state.isStopped) {
        Future.delayed(const Duration(seconds: 2)).then((_) {
          context.read<SlotMachineBloc>().add(const StopMachine());
        });
      }
    });
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
      child: Column(
        children: [
          Flexible(
            child: AbsorbPointer(
              child: Container(
                width: size.width * 0.45,
                height: size.height * 0.7,
                padding: EdgeInsets.only(
                    top: size.height * 0.2, bottom: size.height * 0.1, left: 50, right: 50),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: svg_provider.Svg(boardIc),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _buildRollSlots(),
                ),
              ),
            ),
          ),
          const ControlPanel(),
        ],
      ),
    );
  }

  void _slotMachineListener(BuildContext context, SlotMachineState state) {
    if (state.isSpinning) {
      _triggerControllers(state.prizeIndexes);
    } else {
      _firstController.stop();
      _secondController.stop();
      _thirdController.stop();
      _fourthController.stop();
    }
  }

  void _triggerControllers(List<int> prizeIndexes) async {
    _firstController.animateRandomly(index: prizeIndexes[0]);
    await Future.delayed(const Duration(milliseconds: 100));
    _secondController.animateRandomly(index: prizeIndexes[1]);
    await Future.delayed(const Duration(milliseconds: 100));
    _thirdController.animateRandomly(index: prizeIndexes[2]);
    await Future.delayed(const Duration(milliseconds: 100));
    _fourthController.animateRandomly(index: prizeIndexes[3]);
  }

  void _prizeListener(BuildContext context, SlotMachineState state) async {
    if (state.isSpinning == false && state.prize != null) {
      _showPrizeDialog(context, state);
      _playLottie(state.prize!.lottieType);
    }
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
    );
  }

  void _playLottie(LottieType lottieType) {
    if (lottieType.isConfetti) {
      _confettiLottieController.forward().then((_) => _confettiLottieController.reset());
    } else if (lottieType.isGoldenConfetti) {
      _goldenLottieController.forward().then((_) => _goldenLottieController.reset());
    }
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
      Flexible(
        child: CommonRollSlot(
          controller: _fourthController,
          itemExtend: 50,
          prizes: prizes,
        ),
      ),
    ];
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
