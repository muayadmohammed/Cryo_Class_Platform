import 'package:finalApp/components/route.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/Background.dart';
import 'components/CustomInputFeild.dart';

class Login extends StatefulWidget {
  // bool isLoading;
  // Login({this.isLoading});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  // bool isLoading = true;

  // @override
  // void initState() {
  //   super.initState();

  //   Future.delayed(const Duration(seconds: 5), () {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }
  bool valuefirst = false;
  bool valuesecond = false;

  bool teacher = false;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // if (isLoading == true) {
    //   return Loading();
    // } else {
    return Background(
      size: size,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: ListView(
            children: <Widget>[
              SizedBox(height: size.height / 3.5),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Text(
                  translator.translate("login"),
                  textAlign: TextAlign.center,
                  style: translator.currentLanguage == 'en'
                      ? TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w300,
                          // fontFamily: 'bein1',
                          fontFamily: 'Montserrat',
                          // fontStyle: FontStyle.italic,
                        )
                      : TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                ),
              ),
              SizedBox(height: 10),
              CustomInputField(
                hint: translator.translate("email"),
                size: size,
                prefixIcon: Icons.email,
              ),
              CustomInputField(
                hint: translator.translate("password"),
                size: size,
                prefixIcon: Icons.lock,
                obscure: true,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    translator.translate('teacher'),
                    style:translator.currentLanguage=='en'? TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ):TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                  ),
                  Checkbox(
                    checkColor: Colors.greenAccent,mouseCursor: MouseCursor.defer,
                    activeColor: Colors.red,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    value: this.teacher,
                    onChanged: (bool value) {
                      setState(() {
                        this.teacher = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: size.height / 29),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          SlideRightRoute(
                            widget: MainScreen(
                              teacher: this.teacher,
                            ),
                          ),
                        );
                      },
                      padding: EdgeInsets.all(20),
                      color: Color(0xFF0b132b),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 45,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // }
}
