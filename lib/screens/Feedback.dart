import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'NavigationDrawer.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextStyle _title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );
  TextStyle t1 = TextStyle(
    fontSize: 15,
    color: Color(0XFF707070),
    fontWeight: FontWeight.w600,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );
  TextStyle t = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    letterSpacing: 1,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF7FC4FD),
        appBar: AppBar(
          // iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Feedback',
            style: TextStyle(color: Colors.black, fontFamily: 'Montserrat',fontWeight: FontWeight.w400),
            // style: _title,
          ),
          centerTitle: true, elevation: 4,
        ),
        drawer: NavigationDrawer(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(18.0),
                  ),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 19, vertical: 50),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Full Name',
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Montserrat'),
                          ),
                          Icon(
                            Icons.person_outline,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                            //hoverColor: Colors.blue,
                            ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Email or Phone",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Montserrat'),
                            textAlign: TextAlign.right,
                          ),
                          Icon(
                            Icons.mail_outline,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Massege",
                            style: TextStyle(
                                color: Colors.black, fontFamily: 'Montserrat'),
                          ),
                          Icon(
                            Icons.message,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      TextField(
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      // Center(
                      //   child: Container(
                      //     height: 50,
                      //     width: 200,
                      //     decoration: BoxDecoration(
                      //         color: Colors.blue,
                      //         borderRadius: BorderRadius.circular(20)),
                      //     child: Text(
                      //       'Send',
                      //       textAlign: TextAlign.center,
                      //       style: _title,
                      //     ),
                      //   ),
                      // ),
                      Center(
                        child: Container(
                            height: 50.0,
                            width: 105.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: Colors.blueAccent,
                              color: Colors.blue,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    'Send',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
