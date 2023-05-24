import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sudoku02/core/styles/colors.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: 'Gilroy', //avenir  Poppins gilroy Raleway
      primarySwatch: Colors.blue,
      // todo used this
      // this is using for (sudoku table,sudoku cell,setting page, setting button)
      cardColor: isDarkTheme ? dBGColor : lBGColor,
      scaffoldBackgroundColor:
          isDarkTheme ? dscaffoldBGColor : lscaffoldBGColor,
      // this is using for sudoku table shadow
      shadowColor: isDarkTheme ? dshadowColor : lshadowColor,
      // this is using for sudoku cell text colors
      hintColor: isDarkTheme ? dcellTextColor : lcellTextColor,
      // this is using for sudoku cell user input text colors
      highlightColor: isDarkTheme ? darkUltrathinColor : lcellUserTextColor,
      // this is using for sudoku table background colors
      backgroundColor: isDarkTheme ? dsudokuTableColor : lsudokuTableColor,
      // this is using for (button Svg colors)
      buttonColor: isDarkTheme ? kWhiteColor : lcellUserTextColor,
      // this is using for (circal Avetar colors)
      focusColor: isDarkTheme ? lcellTextColor : lcellTextColor,
      // this is using for (radio button unselected colors)
      unselectedWidgetColor: isDarkTheme ? dcellcolor : lcellcolor,
      // this is using for (radio button selected colors)
      accentColor: lcellTextColor,

      // !

      primaryColor: isDarkTheme ? kWhiteColor : kWhiteColor,
      primaryColorLight:
          isDarkTheme ? kWhiteColor : kBlackColor.withOpacity(0.5),

      brightness: isDarkTheme ? Brightness.dark : Brightness.light,

      textTheme: TextTheme(
        // todo using this
        // this is using for (level)
        headline1: TextStyle(
          color: isDarkTheme ? dTextColor : lcellUserTextColor,
          fontFamily: 'gilroy',
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
          fontSize: 20,
        ),
        // this is using for (All Dialog box Text)
        headline2: TextStyle(
          color: isDarkTheme ? dTextColor : lcellUserTextColor,
          fontFamily: 'gilroy',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        // this is using for (sudoku cell Sovld Text)
        headline3: TextStyle(
          color: isDarkTheme ? dsolevTextColor : lsolevTextColor,
          fontFamily: 'gilroy',
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
        // this is using for (sudoku cell user input text & normale text)
        headline4: TextStyle(
            color: isDarkTheme ? dTextColor : lcellUserTextColor,
            fontFamily: 'gilroy',
            fontSize: 18,
            fontWeight: FontWeight.w900),
        // this is using for (bottome button text)
        headline6: TextStyle(
          color: isDarkTheme ? dTextColor : lcellUserTextColor,
          fontFamily: 'gilroy',
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        // this is using for (dialod box sub menu text)
        subtitle1: TextStyle(
          color: isDarkTheme ? dTextColor : lcellUserTextColor,
          fontFamily: 'gilroy',
          fontWeight: FontWeight.w600,
        ),
        // this is using for (arlte box hedding text)
        headline5: TextStyle(
          color: isDarkTheme ? dTextColor : lcellUserTextColor,
          fontFamily: 'gilroy',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        // this is using for (arlte box body text)
        bodyText1: TextStyle(
          color: isDarkTheme ? dTextColor : darkThinColor,
          fontFamily: 'gilroy',
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        // this is using for (arlte box button text)
        button: TextStyle(
          color: isDarkTheme ? dTextColor : dTextColor,
          fontFamily: 'gilroy',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        // this is using for (achivement text)
        subtitle2: TextStyle(
          color: isDarkTheme ? darkThinColor : darkThinColor,
          fontFamily: 'gilroy',
          fontSize: 12,
        ),
        // ! to
      ),
    );
  }
}
