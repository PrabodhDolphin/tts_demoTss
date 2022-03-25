import 'package:flutter/material.dart';
import 'package:tts_demo/com/theme/custome_colors.dart';

class CustomTheme {
  static ThemeData get darkTheme { //1
    return ThemeData( //2
       // primaryColor: CustomColors.purple,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat', //3
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.blue,
        ),
        buttonTheme: ButtonThemeData( // 4
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          buttonColor: CustomColors.btnColor,
        )
    );
  }
}