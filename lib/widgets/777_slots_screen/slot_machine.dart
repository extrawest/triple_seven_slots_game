import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roll_slot_machine/roll_slot.dart';
import 'package:triple_seven_slots_game/assets.dart';

const boardWidth = 430.0;

class SlotMachine extends StatefulWidget {
  const SlotMachine({Key? key}) : super(key: key);

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
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
    return Flexible(
      child: Stack(
        children: [
          SvgPicture.asset(
            boardIc,
            width: boardWidth,
            height: 330,
          ),
          Positioned(
            top: 100,
            child: Container(
              constraints: const BoxConstraints(maxWidth: boardWidth - 40, maxHeight: 180),
              child: Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: RollSlot(
                        squeeze: 1.2,
                        diameterRation: 10.5,
                        itemPadding: EdgeInsets.zero,
                        itemExtend: 60,
                        children: prizes,
                      ),
                    ),
                    Flexible(
                      child: RollSlot(
                        squeeze: 0.95,
                        diameterRation: 5.5,
                        itemPadding: EdgeInsets.zero,
                        itemExtend: 70,
                        children: prizes,
                      ),
                    ),
                    Flexible(
                      child: RollSlot(
                        squeeze: 1.0,
                        diameterRation: 2.5,
                        itemPadding: EdgeInsets.zero,
                        itemExtend: 70,
                        children: prizes,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
