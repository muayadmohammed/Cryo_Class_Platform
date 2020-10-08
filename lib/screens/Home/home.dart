import 'package:finalApp/components/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../navigation_drawer.dart';
import 'Comment.dart';
import 'add_subject.dart';
import 'create_class.dart';

class Home extends StatefulWidget {
  TextStyle textStyleTitle, textStyleDes, textStyleSearch;
  String name, desc, link;
  bool flink;
  Home({
    @optionalTypeArgs this.textStyleTitle,
    @optionalTypeArgs this.textStyleDes,
    @optionalTypeArgs this.textStyleSearch,
    @optionalTypeArgs this.name,
    @optionalTypeArgs this.desc,
    @optionalTypeArgs this.link,
    @optionalTypeArgs this.flink,
  });
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  bool like = false;
  void _incrementCounter() {
    setState(() {
      like = true;
      _counter++;
    });
  }

  Future<void> _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  String selectedUser;
  final List<String> items = <String>[
    translator.translate('createClass'),
    translator.translate('addSubject'),
  ];

  Future<Null> selectClass(String value) async {
    setState(() {
      selectedUser = value;
    });
  }

  TextStyle textStyleTitleAr = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
  );
  TextStyle textStyleSearchAr = TextStyle(
    fontFamily: ArabicFonts.Cairo,
    package: 'google_fonts_arabic',
    fontWeight: FontWeight.w300,
    color: Colors.grey[600],
    fontSize: 16,
  );
  TextStyle textStyleDesAr = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey[800],
    fontFamily: ArabicFonts.Changa,
    package: 'google_fonts_arabic',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('classTitle'),
          style: textStyleTitleAr,
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (selected) {
              if (selected == 'Add Subject' || selected == 'اضافة موضوع') {
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: AddSubject(textStyleDes: textStyleDesAr,textStyleTitle:textStyleTitleAr,),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  SlideRightRoute(
                    widget: CreateClass(),
                  ),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return items.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: translator.currentLanguage == 'en'
                        ? widget.textStyleDes
                        : textStyleDesAr,
                  ),
                );
              }).toList();
            },
          )
        ],
        elevation: 5,
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Conteant(
            translator.translate('subjectName'),
            translator.translate('description'),
            'https://www.google.com/',
            true,
          );
        },
      ),
    );
  }

  Widget Conteant(String Subject, String Desc, String file, bool ffile) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: <Widget>[
          Align(
            alignment: translator.currentLanguage == 'en'
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
                left: 5,
                right: 5,
              ),
              child: Text(
                Subject,
                textAlign: translator.currentLanguage == 'en'
                    ? TextAlign.left
                    : TextAlign.right,
                style: translator.currentLanguage == 'en'
                    ? TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                      )
                    : TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                        fontFamily: ArabicFonts.Changa,
                        package: 'google_fonts_arabic',
                      ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    Desc,
                    textAlign: translator.currentLanguage == 'en'
                        ? TextAlign.left
                        : TextAlign.right,
                    style: widget.textStyleDes,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _launched = _launchInBrowser(file);
                    }),
                    child: Text(
                      ffile ? file : '',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 10, left: 10, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        translator.currentLanguage == 'en'
                            ? Row(
                                children: [
                                  Text(
                                    '$_counter ',
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.thumb_up,
                                      color: like ? Colors.green : Colors.grey,
                                    ),
                                    onPressed: () {
                                      _incrementCounter();
                                    },
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.thumb_up,
                                      color: like ? Colors.green : Colors.grey,
                                    ),
                                    onPressed: () {
                                      _incrementCounter();
                                    },
                                  ),
                                  Text(
                                    '$_counter ',
                                  ),
                                ],
                              ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              SlideRightRoute(
                                widget: Comment(
                                  textStyleTitle: widget.textStyleTitle,
                                  textStyleDes: widget.textStyleDes,
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Text(
                                '1',
                              ),
                              Text(
                                ' ' + translator.translate('comment'),
                                style: translator.currentLanguage == 'en'
                                    ? widget.textStyleDes
                                    : textStyleDesAr,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
