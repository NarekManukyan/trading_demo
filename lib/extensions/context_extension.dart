import 'dart:ui';

import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_fonts.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get media => MediaQuery.of(this);

  double get height => media.size.height;

  double get bodyHeight => height - 100;

  double get width => media.size.width;

  double get topPadding => media.padding.top;

  double get bottomPadding => media.padding.bottom;

  bool get isDarkMode => media.platformBrightness == Brightness.dark;
}

extension ThemeDataHelper on ThemeData {
  TextStyle get headline1 => textTheme.headline1!;

  TextStyle get headline2 => textTheme.headline2!;

  TextStyle get headline3 => textTheme.headline3!;

  TextStyle get headline4 => textTheme.headline4!;

  TextStyle get headline5 => textTheme.headline5!;

  TextStyle get headline6 => textTheme.headline6!;

  TextStyle get subtitle1 => textTheme.subtitle1!;

  TextStyle get subtitle2 => textTheme.subtitle2!;

  TextStyle get subtitle3 => textTheme.subtitle2!
      .copyWith(
        fontSize: 14,
        letterSpacing: -0.01,
      )
      .medium;

  TextStyle get button1 => textTheme.button!;

  TextStyle get button2 => textTheme.button!.copyWith(
        fontSize: 16,
        height: 1.25,
      );

  TextStyle get button3 => textTheme.button!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1,
      );

  TextStyle get button4 => textTheme.button!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1,
      );

  TextStyle get bodyText1 => textTheme.bodyText1!;

  TextStyle get bodyText2 => textTheme.bodyText2!;

  TextStyle get bodyText3 => textTheme.bodyText2!.copyWith(
        fontSize: 12,
        height: 1.33,
        fontWeight: FontWeight.w500,
        fontFeatures: <FontFeature>[const FontFeature.slashedZero()],
      );

  TextStyle get body17 => textTheme.bodyText2!.size(17);

  TextStyle get caption1 => textTheme.caption!;

  TextStyle get caption2 => textTheme.caption!.bold;

  TextStyle get overline => textTheme.overline!;

  ButtonStyle get elevatedButtonStyle => elevatedButtonTheme.style!;

  ButtonStyle get textButtonStyle => textButtonTheme.style!;
}

extension ElevatedButtonHelper on ThemeData {
  ButtonStyle get grayButtonStyle => elevatedButtonTheme.style!.copyWith(
        foregroundColor: MaterialStateProperty.all(AppColors.white),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.disabled)
                ? AppColors.grayButtonBackgroundColor.withOpacity(0.5)
                : AppColors.grayButtonBackgroundColor;
          },
        ),
      );

  ButtonStyle get blueButtonStyle => elevatedButtonTheme.style!.copyWith(
        foregroundColor: MaterialStateProperty.all(AppColors.white),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 24,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.disabled)
                ? AppColors.blue.withOpacity(0.5)
                : AppColors.blue;
          },
        ),
      );

  ButtonStyle get smallButtonSelectedStyle =>
      elevatedButtonTheme.style!.copyWith(
        foregroundColor: MaterialStateProperty.all(AppColors.white),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            height: 1.33,
            fontWeight: FontWeight.w500,
            fontFeatures: <FontFeature>[FontFeature.slashedZero()],
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.disabled)
                ? AppColors.tub.withOpacity(0.5)
                : AppColors.tub;
          },
        ),
      );

  ButtonStyle get smallButtonUnselectedStyle =>
      elevatedButtonTheme.style!.copyWith(
        foregroundColor: MaterialStateProperty.all(AppColors.white),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 12,
            height: 1.33,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.inter,
            fontFeatures: <FontFeature>[FontFeature.slashedZero()],
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
      );

  ButtonStyle get bigButtonStyle => elevatedButtonTheme.style!.copyWith(
        foregroundColor: MaterialStateProperty.all(AppColors.white),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            color: AppColors.white,
            fontFamily: FontFamily.inter,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            height: 1.5,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
      );
}

// usage example: context.h3.regular.white
extension TextStyleHelpers on TextStyle {
  TextStyle get white => copyWith(color: AppColors.white);

  TextStyle get yellow => copyWith(color: AppColors.yellow);

  TextStyle get red => copyWith(color: AppColors.red);

  TextStyle get error => copyWith(color: AppColors.error);

  TextStyle size([double? fontSize]) => copyWith(fontSize: fontSize);

  TextStyle get regular => copyWith(fontWeight: FontWeight.normal);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
}

extension GlobalKeyEx on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();

    return translation != null && renderObject?.paintBounds != null
        ? renderObject!.paintBounds.shift(Offset(translation.x, translation.y))
        : null;
  }
}
