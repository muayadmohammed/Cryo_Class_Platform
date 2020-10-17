import '../components/route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'Auth/Login.dart';
import 'navigation_drawer.dart';
import 'chat/conversation.dart';

class Profile extends StatefulWidget {
  final TextStyle textStyleDesEn, textStyleDesAr;
  bool teacher;
  Profile({
    @required this.textStyleDesEn,
    @required this.textStyleDesAr,
    @required this.teacher,
  });
  @override
  Profile_State createState() => Profile_State();
}

class Profile_State extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
        drawer: NavigationDrawer(),
        body: Align(
          alignment: Alignment.center,
          child: Center(
            child: MediaQuery.of(context).orientation == Orientation.portrait
                ? new Stack(
                    children: <Widget>[
                      ClipPath(
                        child: Container(
                          color: Colors.black.withOpacity(0.8),
                        ),
                        clipper: getClipper(),
                      ),
                      Positioned(
                          width: 350.0,
                          top: MediaQuery.of(context).size.height / 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                  width: 150.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      image: DecorationImage(
                                        image:
                                            ExactAssetImage("assets/cm0.jpeg"),
                                        // NetworkImage(
                                        // 'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(75.0)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 7.0,
                                            color: Colors.black)
                                      ])),
                              SizedBox(height: 70.0),
                              Text(
                                'Muayad Mohammed',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30.0),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: widget.teacher
                                      ? null
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              translator.translate('stage'),
                                              style: translator
                                                          .currentLanguage ==
                                                      'en'
                                                  ? TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Montserrat')
                                                  : TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                      fontFamily:
                                                          ArabicFonts.Cairo,
                                                      package:
                                                          'google_fonts_arabic',
                                                    ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              translator.translate('fourth'),
                                              style: translator
                                                          .currentLanguage ==
                                                      'en'
                                                  ? TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 17.0,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontFamily: 'Montserrat')
                                                  : widget.textStyleDesAr,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                              SizedBox(height: 15.0),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          translator.translate('emailProfil'),
                                          style: translator.currentLanguage ==
                                                  'en'
                                              ? TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat')
                                              : TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  fontFamily: ArabicFonts.Cairo,
                                                  package:
                                                      'google_fonts_arabic',
                                                ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          'muayadmohammed3@gmail.com',
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              color: Colors.grey[700],
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'Montserrat'),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(height: size.height / 17),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    SlideRightRoute(
                                      widget: Conversation(
                                        teacher: widget.teacher,
                                        textStyleDesEn: widget.textStyleDesEn,
                                        textStyleDesAr: widget.textStyleDesAr,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                   height: 45.0,
                                  width: 115.0,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(20.0),
                                      shadowColor: Colors.blueGrey,
                                      color: Colors.grey,
                                      elevation: 7.0,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.chat),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              translator.translate('Chat'),
                                              style: translator
                                                          .currentLanguage ==
                                                      'en'
                                                  ? TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Montserrat')
                                                  : widget.textStyleDesAr,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                  height: 45.0,
                                  width: 115.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.redAccent,
                                    color: Colors.red,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          SlideRightRoute(
                                            widget: Login(),
                                          ),
                                        );
                                      },
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.logout,
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              translator.translate('logout'),
                                              style: translator
                                                          .currentLanguage ==
                                                      'en'
                                                  ? TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Montserrat')
                                                  : widget.textStyleDesAr,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ))
                    ],
                  )
                : ListView(
                    children: <Widget>[
                      ClipPath(
                        child: Container(
                          color: Colors.black.withOpacity(0.8),
                        ),
                        clipper: getClipper(),
                      ),
                      Positioned(
                          width: 350.0,
                          top: MediaQuery.of(context).size.height / 5,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: 150.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      image: DecorationImage(
                                        image:
                                            ExactAssetImage("assets/cm0.jpeg"),
                                        // NetworkImage(
                                        // 'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(75.0)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 7.0,
                                            color: Colors.black)
                                      ])),
                              SizedBox(height: 70.0),
                              Text(
                                'Muayad Mohammed',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30.0),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: widget.teacher
                                      ? null
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              translator.translate('stage'),
                                              style: translator
                                                          .currentLanguage ==
                                                      'en'
                                                  ? TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Montserrat')
                                                  : TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                      fontFamily:
                                                          ArabicFonts.Cairo,
                                                      package:
                                                          'google_fonts_arabic',
                                                    ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              translator.translate('fourth'),
                                              style: translator
                                                          .currentLanguage ==
                                                      'en'
                                                  ? TextStyle(
                                                      color: Colors.grey[700],
                                                      fontSize: 17.0,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontFamily: 'Montserrat')
                                                  : widget.textStyleDesAr,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),),
                              ),
                              SizedBox(height: 15.0),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          translator.translate('emailProfile'),
                                          style: translator.currentLanguage ==
                                                  'en'
                                              ? TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Montserrat')
                                              : TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                  fontFamily: ArabicFonts.Cairo,
                                                  package:
                                                      'google_fonts_arabic',
                                                ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          'muayadmohammed3@gmail.com',
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 17.0,
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'Montserrat'),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    )),
                              ),
                              SizedBox(height: 50.0),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    SlideRightRoute(
                                      widget: Conversation(
                                        teacher: widget.teacher,
                                        textStyleDesEn: widget.textStyleDesEn,
                                        textStyleDesAr: widget.textStyleDesAr,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                    height: 40.0,
                                    width: 100.0,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(20.0),
                                      shadowColor: Colors.blueGrey,
                                      color: Colors.grey,
                                      elevation: 7.0,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.chat),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              translator.translate('Chat'),
                                              style: translator
                                                          .currentLanguage ==
                                                      'en'
                                                  ? TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Montserrat')
                                                  : widget.textStyleDesAr,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(height: 25.0),
                              Container(
                                  height: 40.0,
                                  width: 100.0,
                                  child: Material(
                                    borderRadius: BorderRadius.circular(20.0),
                                    shadowColor: Colors.redAccent,
                                    color: Colors.red,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          SlideRightRoute(
                                            widget: Login(),
                                          ),
                                        );
                                      },
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Icon(Icons.logout),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              translator.translate('logout'),
                                              style: translator
                                                          .currentLanguage ==
                                                      'en'
                                                  ? TextStyle(
                                                      color: Colors.white,
                                                      fontFamily: 'Montserrat')
                                                  : widget.textStyleDesAr,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          ))
                    ],
                  ),
          ),
        ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
