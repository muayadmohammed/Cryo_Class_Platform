import 'package:finalApp/components/route.dart';
import 'package:finalApp/screens/Home/Student/post_class.dart';
import 'package:finalApp/screens/main_screen.dart';
import 'package:finalApp/util/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../navigation_drawer.dart';
import 'Comment.dart';
import '../Student/add_class.dart';
import 'add_subject.dart';
import 'create_class.dart';

class Home extends StatefulWidget {
  TextStyle textStyleTitleAr,
      textStyleDesAr,
      textStyleSearchAr,
      textStyleTitleEn,
      textStyleDesEn,
      textStyleSearchEn;
  String name, desc, link;
  bool flink, teacher;
  Home({
    @optionalTypeArgs this.textStyleTitleAr,
    @optionalTypeArgs this.textStyleDesAr,
    @optionalTypeArgs this.textStyleSearchAr,
    @optionalTypeArgs this.textStyleTitleEn,
    @optionalTypeArgs this.textStyleDesEn,
    @optionalTypeArgs this.textStyleSearchEn,
    @optionalTypeArgs this.name,
    @optionalTypeArgs this.desc,
    @optionalTypeArgs this.link,
    @optionalTypeArgs this.flink,
    @optionalTypeArgs this.teacher,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.teacher
          ? AppBar(
              title: Text(
                translator.translate('classTitle'),
                style: translator.currentLanguage == 'en'
                    ? widget.textStyleTitleEn
                    : widget.textStyleTitleAr,
              ),
              centerTitle: true,
              actions: [
                PopupMenuButton<String>(
                  onSelected: (selected) {
                    if (selected == 'Add Subject' ||
                        selected == 'اضافة موضوع') {
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          widget: AddSubject(
                            textStyleTitleEn: widget.textStyleTitleEn,
                            textStyleDesEn: widget.textStyleDesEn,
                            textStyleTitleAr: widget.textStyleTitleAr,
                            textStyleDesAr: widget.textStyleDesAr,
                            teacher: widget.teacher,
                          ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        SlideRightRoute(
                          widget: CreateClass(  textStyleTitleEn: widget.textStyleTitleEn,
                            textStyleDesEn: widget.textStyleDesEn,
                            textStyleTitleAr: widget.textStyleTitleAr,
                            textStyleDesAr: widget.textStyleDesAr,
                            teacher: widget.teacher,),
                        ),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return items.map((String value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: translator.currentLanguage == 'en'
                              ? widget.textStyleDesEn
                              : widget.textStyleDesAr,
                        ),
                      );
                    }).toList();
                  },
                )
              ],
              elevation: 5,
            )
          : AppBar(
              title: TextField(
                decoration: InputDecoration(
                  hintText: translator.translate('search'),
                  hintStyle: translator.currentLanguage == 'en'
                      ? widget.textStyleSearchEn
                      : widget.textStyleSearchAr,
                ),
              ),
              actions: [
                //Add new Class
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        widget: AddClass(
                            textStyleTitleEn: widget.textStyleTitleEn,
                            textStyleDesEn: widget.textStyleDesEn,
                            textStyleTitleAr: widget.textStyleTitleAr,
                            textStyleDesAr: widget.textStyleDesAr,
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
 
             Map post = posts[index];
          return PostClass(
            name: post['name'],
            dp: post['dp'],
            textStyleTitleEn: widget.textStyleTitleEn,
            textStyleDesEn: widget.textStyleDesEn,
              textStyleTitleAr: widget.textStyleTitleAr,
            textStyleDesAr: widget.textStyleDesAr,
            teacher: widget.teacher,
          );
        },
      ),
    );
  }

  
}
