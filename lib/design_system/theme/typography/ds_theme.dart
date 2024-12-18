import 'package:flutter/material.dart';
import '../constants/ds_const_color.dart';
import 'ds_base.dart';

class DSTheme {
  static final ThemeData theme = ThemeData(
    primaryColor: DSColors.primary,
    scaffoldBackgroundColor: DSColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: DSColors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: DSColors.black,
      ),
    ),
    useMaterial3: true,
    cardColor: DSColors.primary,
    hoverColor: DSColors.black.withOpacity(0.1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DSColors.white,
      selectedItemColor: DSColors.primary,
      unselectedItemColor: DSColors.secondary,
      enableFeedback: false,
      elevation: 0,
      selectedLabelStyle: DSBase.typography.hint.copyWith(
        color: DSColors.primary,
      ),
      unselectedLabelStyle: DSBase.typography.hint.copyWith(
        color: DSColors.secondary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: DSColors.secondary,
      prefixIconColor: DSColors.secondary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: DSColors.primary,
          width: 1,
        ),
      ),
      fillColor: DSColors.white,
      hintStyle: const TextStyle(
        color: DSColors.black,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: DSColors.primary,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: DSColors.primary,
          width: 1,
        ),
      ),
      iconColor: DSColors.secondary,
      labelStyle: const TextStyle(
        color: DSColors.black,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: DSColors.primary,
      textTheme: ButtonTextTheme.normal,
      disabledColor: DSColors.secondary,
      hoverColor: DSColors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        elevation: WidgetStateProperty.all(0),
        textStyle: WidgetStateProperty.all(DSBase.typography.titleButton),
        minimumSize: WidgetStateProperty.all(const Size(103, 30)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        overlayColor: WidgetStateProperty.all(DSColors.black.withOpacity(0.1)),
        enableFeedback: true,
      ),
    ),
  );
}
