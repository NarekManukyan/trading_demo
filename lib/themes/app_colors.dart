import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  /////////////////////////////////////////////////////////////////////////////
  static const green = MaterialColor(
    0xFF31B984,
    <int, Color>{
      100: Color(0xFFD6F1E6),
      200: Color(0xFFADE3CE),
      300: Color(0xFF83D5B5),
      400: Color(0xFF5AC79D),
      500: Color(0xFF31B984),
      700: Color(0xFF195D42),
      800: Color(0xFF0C2E21),
    },
  );
  static const red = MaterialColor(
    0xFFBF3B4B,
    <int, Color>{
      300: Color(0xFFD98993),
      400: Color(0xFFCC626F),
      500: Color(0xFFBF3B4B),
      600: Color(0xFF8F2C38),
      700: Color(0xFF601E26),
      800: Color(0xFF300F13),
    },
  );
  static const yellow = MaterialColor(
    0xFFEEBB50,
    <int, Color>{
      200: Color(0xFFF8E4B9),
      500: Color(0xFFEEBB50),
    },
  );

  /////////////////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////////////////////////
  // background colors
  static const globalBackground = Color(0xFF0C0E15);
  static const blockBackground = Color(0xFF161822);
  static const blockLinkBackground = Color(0xFF1C1F2C);
  static const popUpBackground = Color(0xFF0E1018);
  static const iconBackground = Color(0xFF242738);
  static const iconBackgroundColor = Color(0xFF242738);
  static const appBarBackgroundColor = Color(0xFF161A24);
  static const grayButtonBackgroundColor = Color(0xFF161A24);
  static const actionButtonBackgroundColor = Color(0xFF24293B);

  /////////////////////////////////////////////////////////////////////////////

  static const darkGreen = Color(0xFF4E8B43);
  static const tub = Color(0xFF282B39);
  static const color2 = Color(0xFF5040C1);
  static const color3 = Color(0xFFBA6CCB);
  static const color4 = Color(0xFFCF4994);
  static const dopGray = Color(0xFF818C99);
  static const white = Color(0xFFFFFFFF);
  static const blue = Color(0xFF5683FF);

  static const error = red;
  static const myLocationActive = yellow;
  static const myLocationInactive = yellow;
}
