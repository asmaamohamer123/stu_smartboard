import 'package:flutter/material.dart';
import 'package:smartboard/core/resources/style.dart';
import 'app_colors.dart';

// to access the themeData properties use {Theme.of(context).}
ThemeData lightTheme() {
  return ThemeData(
      primaryColor: AppColors.primaryColorLight,
      scaffoldBackgroundColor: AppColors.backGroundColorLightMode,
      disabledColor: AppColors.disabledColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        // backgroundColor: AppColors.backGroundColorLightMode,
        iconTheme: IconThemeData(color: AppColors.iconColorLight),
      ),
      drawerTheme: const DrawerThemeData(
          backgroundColor: Color.fromARGB(255, 24, 39, 116)),
      textTheme: TextTheme(
          headlineLarge: black24bold(),
          headlineMedium: black22bold(),
          headlineSmall: black20bold(),
          titleLarge: black18regular(),
          titleMedium: black16regular(),
          titleSmall: black14regular(),
          labelSmall: black12regular()),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryColorLight,
          unselectedItemColor: AppColors.iconColorLight,
          selectedItemColor: AppColors.primaryColorLight,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedIconTheme:
              const IconThemeData(color: AppColors.primaryColorLight),
          unselectedIconTheme: IconThemeData(color: AppColors.iconColorLight)),
      cardTheme: CardTheme(
        elevation: 6.5,
        shadowColor: Colors.black.withOpacity(.5),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorGray, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorBlue, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        // error border style
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorRed, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.colorBlue, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ));
}

ThemeData darkTheme() {
  return ThemeData(
    disabledColor: AppColors.disabledColor,
    primaryColor: AppColors.primaryColorDark,
    scaffoldBackgroundColor: AppColors.backGroundColorDarkMode,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.primaryColorDark,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.iconColorDark)),
    drawerTheme: const DrawerThemeData(
        backgroundColor: AppColors.backGroundColorDarkMode),
    textTheme: TextTheme(
        headlineLarge: white24bold(),
        headlineMedium: white22bold(),
        headlineSmall: white20bold(),
        titleLarge: white18regular(),
        titleMedium: white16regular(),
        titleSmall: white14regular(),
        labelSmall: white12regular()),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.primaryColorDark,
      unselectedItemColor: AppColors.iconColorDark,
      selectedItemColor: AppColors.primaryColorLight,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedIconTheme: const IconThemeData(color: AppColors.primaryColorDark),
      unselectedIconTheme: IconThemeData(color: AppColors.iconColorDark),
    ),
    cardTheme: const CardTheme(elevation: 0),
  );
}
