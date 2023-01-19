import 'package:flutter/material.dart';

const primaryWhite = Colors.white;
const primaryRed = Colors.red;
const lightRed1 = Color(0xfffe7b79);

const brown1 = Color(0xff433431);
const brown2 = Color(0xff6f4337);
const lightOrange1 = Color(0xffe7a727);
const lightOrange2 = Color(0xfffee361);

const darkPurple1 = Color(0xff0f074a);
const darkPurple2 = Color(0xff4e128b);

const darkPurpleGradient = LinearGradient(
  colors: [
    darkPurple1,
    darkPurple2,
    darkPurple1,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const lightRedGradient = LinearGradient(
  colors: [
    lightRed1,
    primaryRed,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const lightOrangeGradient = LinearGradient(
  colors: [
    lightOrange2,
    lightOrange1,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

class TextStyles {
  static const bodyReg20 = TextStyle(color: primaryWhite, fontSize: 20);
  static const bodyReg22 = TextStyle(color: primaryWhite, fontSize: 22);
  static const bodyReg24 = TextStyle(color: primaryWhite, fontSize: 24);
  static const h1Bold38 = TextStyle(color: primaryWhite, fontSize: 38, fontWeight: FontWeight.w700);
}
