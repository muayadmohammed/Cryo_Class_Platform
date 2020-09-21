import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
/*
  void _launchUrl(String Url) async {
    if (await canLaunch(Url)) {
      await launch(Url);
    } else {
      throw "!! غير موجود  ";
    }
  }

  void _launchCall(String number) async {
    var _number = "tel:$number";
    _launchUrl(_number);
  }

  void _launchEmail(String email) async {
    var _email = "mailto:$email";
    _launchUrl(_email);
  }
*/
  @override
  TextStyle _text_HomePages = TextStyle(
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 16,
  );
   TextStyle _contact = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: Colors.blue,
      fontFamily: ArabicFonts.Cairo,
      package: 'google_fonts_arabic',
    );
 
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            Image.asset(
              'assets/logo.JPG',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '❤️😂هم حبشكلات العيد',
                style: _text_HomePages,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              ': يرجى التواصل معنا عبر'
              '\n'
              '\n'
              ' البريد الالكتروني ',
              style: _text_HomePages,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                // _launchEmail("muayadmohammed3@gmail.com");
              },
              child: Text(
                'muayadmohmmed3@gmail.com',
                style: _contact,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              ': او اتصل على ',
              style: _text_HomePages,
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                // _launchCall("07712218579");
              },
              child: Text(
                '07712218579',
                style: _contact,
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: () {
                // _launchCall('07808816034');
              },
              child: Text(
                '07808816034',
                style: _contact,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}