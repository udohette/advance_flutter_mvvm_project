import 'package:advance_fluuter_project/resources/color_manager.dart';
import 'package:advance_fluuter_project/resources/font_manager.dart';
import 'package:advance_fluuter_project/resources/styles_manager.dart';
import 'package:advance_fluuter_project/resources/val;ues_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main color of the App
      primaryColor: ColorManager.primary,
      primaryColorDark: ColorManager.darkPrimary,
      primaryColorLight: ColorManager.primaryOpacity70,
      disabledColor: ColorManager.grey1,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),
      //Ripple Color
      splashColor: ColorManager.primaryOpacity70,
      //Card View Theme
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.grey,
        elevation: AppSize.s4,
      ),
      //App Bar Theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle: getRegularTextStyle(
            fontSize: FontSize.s16, color: ColorManager.white),
      ),
      //Button Theme
      buttonTheme: ButtonThemeData(
        shape: StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.primaryOpacity70,
      ),
      //elevated Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularTextStyle(
                fontSize: FontSize.s12, color: ColorManager.white),
            primary: ColorManager.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppPadding.p12))),
      ),
      //Text Theme
      textTheme: TextTheme(
          headline1: getSemiBoldTextStyle(
              fontSize: FontSize.s16, color: ColorManager.darkGrey),
          subtitle1: getMediumTextStyle(
              fontSize: FontSize.s14, color: ColorManager.lightGrey),
          subtitle2: getMediumTextStyle(
              fontSize: FontSize.s14, color: ColorManager.primary),
          caption: getRegularTextStyle(
              fontSize: FontSize.s12, color: ColorManager.grey1),
          bodyText1: getRegularTextStyle(
              fontSize: FontSize.s12, color: ColorManager.grey)),
      // input decoration Theme
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.all(AppPadding.p8),
          hintStyle: getRegularTextStyle(
              fontSize: FontSize.s12, color: ColorManager.grey1),
          //label style
          labelStyle: getMediumTextStyle(
              fontSize: FontSize.s12, color: ColorManager.darkGrey),
          //error Style
          errorStyle: getRegularTextStyle(
              fontSize: FontSize.s12, color: ColorManager.error),
          //enable border
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          //focus border
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.circular(AppSize.s8)),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          //focus error border
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
              borderRadius: BorderRadius.circular(AppSize.s8))));
}
