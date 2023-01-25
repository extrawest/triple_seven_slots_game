import 'package:flutter/material.dart';

const primaryWhite = Colors.white;
const primaryRed = Colors.red;
const lightRed1 = Color(0xfffe7b79);

const brown1 = Color(0xff433431);
const brown2 = Color(0xff6f4337);
const lightOrange = Color(0xffF1EED1);
const lightOrange1 = Color(0xffe7a727);
const lightOrange2 = Color(0xfffee361);

const orange1 = Color(0xffD69317);
const orange2 = Color(0xffD8AC3C);
const orange3 = Color(0xffee8b10);
const orange4 = Color(0xffb97f11);
const orange5 = Color(0xffCC890B);
const orange6 = Color(0xffFFF38F);

const darkOrange = Color(0xffc29139);

const orangeGradientLight = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment(0.5, 0.8),
  colors: [
    orange5,
    orange6,
  ],
);

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
  static const clarendonReg18 = TextStyle(color: primaryWhite, fontSize: 18, fontFamily: 'Clarendon');
  static const clarendonReg22 = TextStyle(color: primaryWhite, fontSize: 22, fontFamily: 'Clarendon');
  static const bodyReg16 = TextStyle(color: primaryWhite, fontSize: 16);
  static const bodyReg20 = TextStyle(color: primaryWhite, fontSize: 20);
  static const bodyReg22 = TextStyle(color: primaryWhite, fontSize: 22);
  static const bodyReg24 = TextStyle(color: primaryWhite, fontSize: 24);
  static const h1Bold38 = TextStyle(color: primaryWhite, fontSize: 38, fontWeight: FontWeight.w700);
  static const h2Bold32 = TextStyle(color: primaryWhite, fontSize: 32, fontFamily: 'Clarendon');
}
