
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'class_info.dart';

class PostClass extends StatefulWidget {
  final String dp;
  final String name;
  final TextStyle textStyleTitleEn,
      textStyleDesEn,
      textStyleTitleAr,
      textStyleDesAr;
  bool teacher;
  PostClass({
    Key key,
    @required this.dp,
    @required this.name,
    @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
    @required this.teacher,
  }) : super(key: key);
  @override
  _PostClassState createState() => _PostClassState();
}

class _PostClassState extends State<PostClass> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),

          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ClassInfo(
                        textStyleTitleEn: widget.textStyleTitleEn,
                        textStyleDesEn: widget.textStyleDesEn,
                        textStyleTitleAr: widget.textStyleTitleAr,
                        textStyleDesAr: widget.textStyleDesAr,
                      )));
            },
            child: Container(
              // height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      translator.translate('className'),
                      style: translator.currentLanguage == 'en'
                          ? widget.textStyleTitleEn
                          : widget.textStyleTitleAr,
                      // translator.translate('subjectName'),
                      // style: translator.currentLanguage == 'en'
                      //     ? widget.textStyleDesEn
                      //     : widget.textStyleDesAr,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text("${widget.name}",
                          style: translator.currentLanguage == 'en'
                              ? TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                )
                              : TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontFamily: ArabicFonts.Cairo,
                                  package: 'google_fonts_arabic',
                                )
                          // ? widget.textStyleTitleEn
                          // : widget.textStyleTitleAr,

                          ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
