import 'package:expense_project/expenses.dart';
import 'package:flutter/material.dart';

//seed color
var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 99, 181));

var kDrakColor=ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 99, 1250), brightness: Brightness.dark,);
void main() {
  runApp(
    MaterialApp(
      // for setting up the dark theme mode
      darkTheme: ThemeData.dark().copyWith(useMaterial3: true,
      colorScheme: kDrakColor,
       cardTheme: const CardTheme().copyWith(
            color: kDrakColor.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
            elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDrakColor.primaryContainer,
            ),
          )
          ),


      // for setting the entire theme  color background.
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          // basically for setting the margin in the theme
          cardTheme: const CardTheme().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          // for setting up the button theme 
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
            ),
          ),
          // for setting up the text theme .
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kDrakColor.onSecondaryContainer,
                  fontSize: 14
                  ),
               ),
            ),
            themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
