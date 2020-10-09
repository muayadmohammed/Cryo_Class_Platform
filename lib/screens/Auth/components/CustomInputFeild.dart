import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key key,
    this.hint = "Enter Text",
    this.obscure = false,
    this.prefixIcon,
    this.size,
  }) : super(key: key);

  final String hint;
  final bool obscure;
  final IconData prefixIcon;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            style: TextStyle(
              color: Colors.white,
            ),
            obscureText: obscure,
            decoration: InputDecoration(
              icon: Icon(
                prefixIcon,
                color: Colors.white,
              ),
              hintText: hint,
              hintStyle: translator.currentLanguage == 'en'
                  ? TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    )
                  : TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontFamily: ArabicFonts.Cairo,
                      package: 'google_fonts_arabic',
                    ),
              border: InputBorder.none,
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 2,
          )
        ],
      ),
    );
  }
}
