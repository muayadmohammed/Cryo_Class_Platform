import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'Ab.dart';
import 'About.dart';
import 'Contact.dart';
import 'Feedback.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    TextStyle _title = TextStyle(
      // fontSize: 15,
      // fontWeight: FontWeight.bold,
      // color: Colors.black,
      // fontFamily: ArabicFonts.Cairo,
      // package: 'google_fonts_arabic',
       color: Colors.black.withOpacity(0.6), fontSize: 20, fontWeight: FontWeight.w300
    );

    Widget _Sizebox = SizedBox(
      height: 12,
    );
    Widget padding(Widget padding) {
      return Padding(
        padding: const EdgeInsets.only(left: 8),
        child: padding,
      );
    }

    return  Drawer(
        //  child: drawerItems,

        child: ListView(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(),
              child: Image.asset(
                'assets/logo.JPG',
                fit: BoxFit.cover,
              ),
              // child: Image.network('http://muayad.aba.vg/images/AllProject/s1.png',fit: BoxFit.cover,),
            ),
         
            Divider(
              height: 0,
              thickness: 0,
              color: Colors.blue,
            ),
            _Sizebox,
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => Contact(),
                  ),
                );
              },
              child: padding(
                Text(
                  'Contact',
                  style: _title,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            _Sizebox,
            Divider(
              height: 0,
              thickness: 0,
              color: Colors.blue,
            ),
            _Sizebox,
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => FeedBack(),
                  ),
                );
              },
              child: padding(Text(
                      'Feedback',
                      style: _title,
                      textAlign: TextAlign.left,
                    ),)
            ),
            _Sizebox,
            Divider(
              height: 0,
              thickness: 0,
              color: Colors.blue,
            ),
            _Sizebox,
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => About(),
                  ),
                );
              },
              child:padding(Text(
                      'About',
                      style: _title,
                      textAlign: TextAlign.left,
                    ),)
            ),
            _Sizebox,
            Divider(
              height: 0,
              thickness: 0,
              color: Colors.blue,
            ),
         
          ],
        ),
       
      );
     
  }
}
