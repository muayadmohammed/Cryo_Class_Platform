import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'home_tasks.dart';

class Evaluation extends StatefulWidget {
  TextStyle textStyleTitleEn, textStyleDesEn, textStyleTitleAr, textStyleDesAr;
  Evaluation({
    @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
  });
  @override
  _EvaluationState createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
  double _value = 0.0;
  void _setValue(double value) => setState(() => _value = value);

  static const double minValue = 0;
  static const double maxValue = 100;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFFECEFF0),
      appBar: AppBar(
        elevation: 5,
        title: Text(
          translator.translate('evaluation'),
          style: translator.currentLanguage == 'en'
              ? widget.textStyleTitleEn
              : widget.textStyleTitleAr,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: ListView(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  translator.translate('name'),
                                  style: translator.currentLanguage == 'en'
                                      ? widget.textStyleTitleEn
                                      : widget.textStyleTitleAr,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Divider(),
                                Text(
                                  translator.translate('subject'),
                                  style: translator.currentLanguage == 'en'
                                      ? widget.textStyleDesEn
                                      : widget.textStyleDesAr,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // Divider(),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 7),
                                    height: 94,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                    ),
                                    child: Text(
                                      'هنا تعرض الملفات الي رفعها الطالب اللون والحجم يتغير بناء على ملفات الطالب ',
                                      style: translator.currentLanguage == 'en'
                                          ? TextStyle(
                                              color: Colors.white, fontSize: 20)
                                          : widget.textStyleDesAr,
                                      textAlign: TextAlign.center,
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                // Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      translator.translate('degree'),
                                      style: translator.currentLanguage == 'en'
                                          ? TextStyle(
                                              fontSize: 17,
                                              color: Color(0XFF4a4a4a))
                                          : widget.textStyleDesAr,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 35,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.3,
                                              color: Colors.grey[900])),
                                      // color: Colors.teal,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          hintText: '0-100',
                                          // hintStyle: TextStyle()
                                        ),
                                        maxLengthEnforced: false,
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                                // Divider(),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 3,
                  right: 10,
                  left: 10,
                  child: SizedBox(
                    height: 70,
                    child: Card(
                      elevation: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) => HomeTasks(
                                    textStyleTitleEn: widget.textStyleTitleEn,
                                    textStyleDesEn: widget.textStyleDesEn,
                                    textStyleTitleAr: widget.textStyleTitleAr,
                                    textStyleDesAr: widget.textStyleDesAr,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.1, color: Colors.black)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  translator.translate('cancel'),
                                  // style: TextStyle(
                                  //   fontSize: 14,
                                  // )
                                  style: translator.currentLanguage == 'en'
                                    ? widget.textStyleDesEn
                                    : widget.textStyleDesAr,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.grey[350],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Row(
                                  children: [
                                    Text(
                                      translator.translate('send'),
                                      // style: TextStyle(
                                      //     fontSize: 18, color: Colors.blue),
                                      style: translator.currentLanguage == 'en'
                                    ? widget.textStyleDesEn
                                    : widget.textStyleDesAr,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Icon(Icons.send,
                                        size: 18, color: Colors.blue),
                                  ],
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
