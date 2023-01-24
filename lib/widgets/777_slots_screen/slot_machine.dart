import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:roll_slot_machine/roll_slot_controller.dart';
import 'package:triple_seven_slots_game/assets.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/common_roll_slot.dart';
import 'package:triple_seven_slots_game/widgets/777_slots_screen/control_panel.dart';

class SlotMachine extends StatefulWidget {
  const SlotMachine({Key? key}) : super(key: key);

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
  final RollSlotController _firstController = RollSlotController();
  final RollSlotController _secondController = RollSlotController();
  final RollSlotController _thirdController = RollSlotController();
  final RollSlotController _fourthController = RollSlotController();

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
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
}
