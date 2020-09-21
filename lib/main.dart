import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/Loading.dart';
import 'util/theme_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CryoClass',
      theme: themeData(ThemeConfig.lightTheme),
      darkTheme: themeData(ThemeConfig.darkTheme),
      home: Loading()
    );
  }

  ThemeData themeData(ThemeData theme) {
    return theme.copyWith(
      textTheme: GoogleFonts.sourceSansProTextTheme(
        theme.textTheme,
      ),
    );
  }
}
