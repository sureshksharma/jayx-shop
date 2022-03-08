import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(darkBluishColor),
        )),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: darkBluishColor),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
  static ThemeData get darkTheme => ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        cardColor: Colors.black,
        canvasColor: dartCreamColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(lightBluishColor),
        )),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
  static Color creamColor = Color(0xfff5f5f5);
  static Color dartCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
