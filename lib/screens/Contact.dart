import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  TextStyle textStyleTitle;
  Contact({
    @required this.textStyleTitle,
  });
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Contact',
            style: widget.textStyleTitle,
          ),
          centerTitle: true,
          elevation: 5,
        ),
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
                style: widget.textStyleTitle,
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
              style: widget.textStyleTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                _launchEmail("muayadmohammed3@gmail.com");
              },
              child: Text(
                'muayadmohmmed3@gmail.com',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              ': او اتصل على ',
              style: widget.textStyleTitle,
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () {
                _launchCall("07712218579");
              },
              child: Text(
                '07712218579',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: () {
                _launchCall('07808816034');
              },
              child: Text(
                '07808816034',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat',
                ),
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
