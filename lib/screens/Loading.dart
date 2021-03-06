import 'dart:async';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'Auth/Login.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToLogin();
      } else {
        _navigateToHome();
      }
    });
  }

//muayad mohammed
  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return true;
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Login()));
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Color(0xFF54C5E6),
              highlightColor: const Color(0xFFFF8C00),
              child: Text(
                translator.translate('welcome'),
                textAlign: TextAlign.center,
                style: translator.currentLanguage == 'en'
                    ? TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      )
                    : TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              translator.translate('please'),
              style: translator.currentLanguage == 'en'
                  ? TextStyle(
                      color: Colors.black,
                    
                      fontWeight: FontWeight.w300,
                      // fontFamily: 'bein1',
                      fontFamily: 'Montserrat',
                      // fontStyle: FontStyle.italic,
                    )
                  : TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
