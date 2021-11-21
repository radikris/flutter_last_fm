import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:last_fm_api/theme/app_color.dart';
import 'package:last_fm_api/theme/app_dimen.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData themeData = ThemeData(
    textTheme: _textTheme,
    colorScheme: _colorScheme,
    primaryColor: _colorScheme.primary,
    primaryColorDark: _colorScheme.primaryVariant,
    primaryColorLight: AppColor.primary300,
    accentColor: _colorScheme.secondary,
    backgroundColor: _colorScheme.background,
    errorColor: _colorScheme.error,
    cardColor: _colorScheme.surface,
    disabledColor: AppColor.inactiveColor,
    scaffoldBackgroundColor: AppColor.appBackground,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: _colorScheme.secondary,
      selectionColor: _colorScheme.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.inactiveColor, width: AppDimen.commonBorderWidth),
        borderRadius: BorderRadius.all(Radius.circular(AppDimen.simpleRadius)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.text800, width: AppDimen.commonBorderWidth),
        borderRadius: BorderRadius.all(Radius.circular(AppDimen.simpleRadius)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.text800, width: AppDimen.commonBorderWidth),
        borderRadius: BorderRadius.all(Radius.circular(AppDimen.simpleRadius)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.errorColor, width: AppDimen.commonBorderWidth),
        borderRadius: BorderRadius.all(Radius.circular(AppDimen.simpleRadius)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.errorColor, width: AppDimen.commonBorderWidth),
        borderRadius: BorderRadius.all(Radius.circular(AppDimen.simpleRadius)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.disabledColor, width: AppDimen.commonBorderWidth),
        borderRadius: BorderRadius.all(Radius.circular(AppDimen.simpleRadius)),
      ),
      hintStyle: _textTheme.bodyText1!.copyWith(color: AppColor.inactiveColor),
      labelStyle: _textTheme.headline5!.copyWith(color: AppColor.inactiveColor),
      errorStyle: _textTheme.bodyText2!.copyWith(color: AppColor.errorColor),
      contentPadding: EdgeInsets.only(
        top: AppDimen.simpleSizeVertical,
        bottom: AppDimen.simpleSizeVertical,
        left: AppDimen.commonSizeHorizontal,
        right: AppDimen.commonSizeHorizontal,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle?>(_textTheme.button),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
            EdgeInsets.symmetric(vertical: AppDimen.simpleSizeVertical, horizontal: AppDimen.commonSizeHorizontal)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.elliptical(
                AppDimen.mediumRadius,
                AppDimen.mediumRadius,
              ),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColor.disabledColor;
            }
          },
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _colorScheme.onPrimary,
      shadowColor: AppColor.grey200,
      centerTitle: false,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _colorScheme.onPrimary,
      selectedLabelStyle: _textTheme.bodyText2!.copyWith(fontWeight: _bold),
      unselectedLabelStyle: _textTheme.bodyText2,
    ),
    dividerTheme: DividerThemeData(
      thickness: AppDimen.commonBorderWidth,
      space: AppDimen.commonSizeHorizontal,
    ),
    tabBarTheme: TabBarTheme(
      labelStyle: _textTheme.subtitle1,
      labelColor: AppColor.activeColor,
      unselectedLabelStyle: _textTheme.subtitle1,
      unselectedLabelColor: AppColor.inactiveColor,
      labelPadding: EdgeInsets.only(top: AppDimen.smallestSizeVertical),
    ),
    switchTheme: const SwitchThemeData(),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );

  /// ColorSchemes.
  static const ColorScheme _colorScheme = ColorScheme(
    primary: AppColor.primary500,
    primaryVariant: AppColor.primary900,
    secondary: AppColor.primary900,
    secondaryVariant: AppColor.primary800,
    surface: AppColor.primary500,
    background: AppColor.appBackground,
    error: AppColor.errorColor,
    onPrimary: AppColor.primary500,
    onSecondary: AppColor.primary800,
    onSurface: AppColor.primary200,
    onBackground: AppColor.appBackground,
    onError: AppColor.errorColor,
    brightness: Brightness.light,
  );

  /// TextTheme
  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _bold = FontWeight.w600;

  static final TextTheme _textTheme = TextTheme(
    headline1: TextStyle(fontWeight: _regular, fontSize: 97.0.sp, height: 1.3, letterSpacing: -1.5),
    headline2: TextStyle(fontWeight: _regular, fontSize: 61.0.sp, height: 1.3, letterSpacing: -0.5),
    headline3: TextStyle(fontWeight: _regular, fontSize: 48.0.sp, height: 1.3),
    headline4: TextStyle(fontWeight: _bold, fontSize: 32.0.sp, height: 1.3, letterSpacing: 0.25),
    headline5: TextStyle(fontWeight: _bold, fontSize: 24.0.sp, height: 1.3),
    headline6: TextStyle(fontWeight: _bold, fontSize: 20.0.sp, height: 1.3, letterSpacing: 0.15),
    subtitle1: TextStyle(fontWeight: _bold, fontSize: 16.0.sp, height: 1.2, letterSpacing: 0.15),
    subtitle2: TextStyle(fontWeight: _bold, fontSize: 14.0.sp, height: 1.2, letterSpacing: 0.1),
    bodyText1: TextStyle(fontWeight: _regular, fontSize: 16.0.sp, height: 1.3, letterSpacing: 0.5),
    bodyText2: TextStyle(fontWeight: _regular, fontSize: 14.0.sp, height: 1.3, letterSpacing: 0.25),
    caption: TextStyle(fontWeight: _bold, fontSize: 12.0.sp, height: 1.3),
    button: TextStyle(fontWeight: _bold, fontSize: 16.0.sp, height: 1.2),
  ).apply(
    bodyColor: AppColor.text800,
    displayColor: AppColor.text800,
    fontFamily: 'Lexend',
  );
}
