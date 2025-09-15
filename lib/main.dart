// import 'package:blog/screens/homescreen.dart';
import 'package:blog/screens/homescreen.dart';
import 'package:blog/screens/onbording_screen.dart';
import 'package:flutter/material.dart';



final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);

void main() {
  runApp(const BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Blog App',
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xFFF7F7F7),
            primaryColor: const Color(0xFFFFFFFF),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFFFFFFF),
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(color: Colors.black),
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
              bodyMedium: TextStyle(color: Colors.black87, fontFamily: 'Montserrat'),
            ),
            cardColor: const Color(0xFFF2F2F2),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF181A20),
            primaryColor: const Color(0xFF1F222A),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1F222A),
              elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
              bodyMedium: TextStyle(color: Colors.white70, fontFamily: 'Montserrat'),
            ),
            cardColor: const Color(0xFF23262B),
          ),
          themeMode: mode,
          home: const OnboardingScreen(),
        );
      },
    );
  }
}

