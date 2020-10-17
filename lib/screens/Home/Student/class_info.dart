import '../../../components/route.dart';
import '../../../screens/Home/Teacher/Comment.dart';
import '../../../util/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:url_launcher/url_launcher.dart';

class ClassInfo extends StatefulWidget {
  final TextStyle textStyleTitleEn,
      textStyleDesEn,
      textStyleTitleAr,
      textStyleDesAr;
  ClassInfo({
    @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
  });
  @override
  _ClassInfoState createState() => _ClassInfoState();
}

class _ClassInfoState extends State<ClassInfo> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          translator.translate('className'),
          style: translator.currentLanguage == 'en'
              ? widget.textStyleTitleEn
              : widget.textStyleTitleAr,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: posts.length,
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
                    style: translator.currentLanguage == 'en'
                        ? widget.textStyleDesEn
                        : widget.textStyleDesEn,
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
                                  textStyleTitleEn: widget.textStyleTitleEn,
                                  textStyleDesEn: widget.textStyleDesEn,
                                  textStyleTitleAr: widget.textStyleTitleAr,
                                  textStyleDesAr: widget.textStyleDesAr,
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
                                    ? widget.textStyleDesEn
                                    : widget.textStyleDesEn,
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
