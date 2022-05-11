import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

final base = ThemeData.light();

final lightTheme = base.copyWith(
  shadowColor: AppColors.yellow,
  splashColor: AppColors.blue.withOpacity(.1),
  hoverColor: AppColors.blue.withOpacity(.1),
  focusColor: AppColors.blue.withOpacity(.1),
  highlightColor: AppColors.blue.withOpacity(.1),
  cardTheme: base.cardTheme.copyWith(
    color: AppColors.blockBackground,
    elevation: 0,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  colorScheme: base.colorScheme.copyWith(
    primary: AppColors.white,
    onPrimary: AppColors.white,
    brightness: Brightness.dark,
  ),
  tabBarTheme: TabBarTheme(
    unselectedLabelStyle: base.primaryTextTheme.button!.copyWith(
      color: AppColors.white,
    ),
    labelStyle: const TextStyle(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      height: 1,
    ),
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      color: AppColors.white,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: AppColors.white,
    unselectedLabelColor: AppColors.white,
    labelPadding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  ),
  primaryColor: AppColors.yellow,
  // shadowColor: Colors.grey[300],
  scaffoldBackgroundColor: AppColors.globalBackground,
  dividerColor: AppColors.white,
  dividerTheme: base.dividerTheme.copyWith(
    space: 1,
    indent: 0,
    endIndent: 0,
    color: AppColors.dopGray.withOpacity(.1),
  ),
  primaryIconTheme: base.primaryIconTheme.copyWith(color: AppColors.white),
  iconTheme: base.iconTheme.copyWith(color: AppColors.white),
  appBarTheme: base.appBarTheme.copyWith(
    color: AppColors.appBarBackgroundColor,
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: AppColors.white,
    ),
    titleTextStyle: base.primaryTextTheme.headline6!.copyWith(
      fontFamily: FontFamily.inter,
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      letterSpacing: -.4,
      height: 1.1,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.light,
    toolbarTextStyle: base.textTheme
        .copyWith(
          bodyText1: base.textTheme.bodyText1!.copyWith(
            fontFamily: FontFamily.inter,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          headline6: base.textTheme.headline6!.copyWith(
            fontFamily: FontFamily.inter,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          headline3: base.textTheme.headline3!.copyWith(
            fontFamily: FontFamily.inter,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
          headline4: base.textTheme.headline4!.copyWith(
            fontFamily: FontFamily.inter,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        )
        .bodyText2,
  ),
  bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
    backgroundColor: AppColors.white,
    elevation: 0,
  ),
  chipTheme: base.chipTheme.copyWith(
    backgroundColor: Colors.transparent,
    labelPadding: const EdgeInsets.symmetric(horizontal: 20),
    labelStyle: const TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.inter,
    ),
    selectedColor: AppColors.white,
    secondaryLabelStyle: const TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.inter,
    ),
    secondarySelectedColor: Colors.transparent,
  ),
  sliderTheme: base.sliderTheme.copyWith(
    activeTrackColor: AppColors.red,
    inactiveTrackColor: AppColors.white,
    overlayColor: Colors.transparent,
    thumbColor: AppColors.red,
    thumbShape: SliderComponentShape.noOverlay,
    valueIndicatorColor: AppColors.red,
  ),
  textSelectionTheme: base.textSelectionTheme.copyWith(
    cursorColor: AppColors.yellow,
    selectionHandleColor: AppColors.yellow,
  ),
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: AppColors.yellow,
  ),
  brightness: Brightness.dark,
  inputDecorationTheme: base.inputDecorationTheme.copyWith(
    errorStyle: const TextStyle(
      color: AppColors.red,
      fontFamily: FontFamily.inter,
    ),
    hintStyle: base.primaryTextTheme.bodyText1!.copyWith(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: -.32,
      height: 1.25,
    ),
    fillColor: AppColors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 2,
      ),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
    ),
    filled: true,
    labelStyle: const TextStyle(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: -.32,
      height: 1.25,
    ),
  ),
  buttonTheme: base.buttonTheme.copyWith(
    textTheme: ButtonTextTheme.primary,
    buttonColor: AppColors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
      ),
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? TextStyle(
                  color: AppColors.white.withOpacity(0.5),
                  fontFamily: FontFamily.inter,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.1,
                )
              : const TextStyle(
                  color: AppColors.white,
                  fontFamily: FontFamily.inter,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.1,
                );
        },
      ),
      shape: MaterialStateProperty.resolveWith((state) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        );
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.disabled)
            ? AppColors.white.withOpacity(0.4)
            : AppColors.white;
      }),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? AppColors.white.withOpacity(0.4)
              : AppColors.white;
        },
      ),
      overlayColor: MaterialStateProperty.all(
        AppColors.white.withOpacity(.5),
      ),
    ),
  ),
  tooltipTheme: TooltipThemeData(
    preferBelow: false,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
      ),
      overlayColor: MaterialStateProperty.all(AppColors.blue.withOpacity(.1)),
      minimumSize: MaterialStateProperty.all(Size.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: MaterialStateProperty.all(0),
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return const TextStyle(
            color: AppColors.white,
            fontFamily: FontFamily.inter,
            fontWeight: FontWeight.w600,
            fontSize: 17,
            height: 1.41,
          );
        },
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      foregroundColor: MaterialStateProperty.all(AppColors.white),
    ),
  ),
  toggleableActiveColor: AppColors.red,
  textTheme: base.primaryTextTheme.copyWith(
    headline1: base.primaryTextTheme.headline1!.copyWith(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.bold,
      fontSize: 22,
      height: 1.45,
    ),
    headline2: base.primaryTextTheme.headline2!.copyWith(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      height: 1.5,
    ),
    headline3: base.primaryTextTheme.headline3!.copyWith(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1,
    ),
    headline4: base.primaryTextTheme.headline4!.copyWith(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.normal,
      fontSize: 26,
      letterSpacing: -.52,
      height: 1,
    ),
    headline5: base.primaryTextTheme.headline5!.copyWith(
      fontFamily: FontFamily.inter,
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: -.48,
      height: 1.2,
    ),
    headline6: base.primaryTextTheme.headline6!.copyWith(
      fontFamily: FontFamily.inter,
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22,
      height: 1.45,
    ),
    subtitle1: base.primaryTextTheme.subtitle1!.copyWith(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      height: 1.25,
      letterSpacing: -.32,
    ),
    subtitle2: base.primaryTextTheme.subtitle2!.copyWith(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.5,
      letterSpacing: -.32,
    ),
    bodyText1: base.primaryTextTheme.bodyText1!.copyWith(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.w600,
      fontSize: 17,
      height: 1.41,
    ),
    bodyText2: base.primaryTextTheme.bodyText2!.copyWith(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.w500,
      fontFeatures: [const FontFeature.slashedZero()],
      fontSize: 12,
      height: 1.33,
    ),
    caption: const TextStyle(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.normal,
      fontSize: 12,
      height: 1.33,
    ),
    overline: const TextStyle(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.normal,
      fontSize: 10,
      height: 1.1,
      letterSpacing: -.1,
    ),
    button: const TextStyle(
      color: AppColors.white,
      fontFamily: FontFamily.inter,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      height: 1.1,
    ),
  ),
);
