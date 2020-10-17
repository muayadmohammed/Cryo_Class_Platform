import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class CreateClass extends StatefulWidget {
  TextStyle textStyleTitleEn, textStyleDesEn, textStyleTitleAr, textStyleDesAr;
  bool teacher;
  CreateClass({
    @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
    @required this.teacher,
  });
  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('createClass'),
          style: translator.currentLanguage == 'en'
              ? widget.textStyleTitleEn
              : widget.textStyleTitleAr,
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF1a73e9),
                    width: 1.5,
                  ),
                ),
                labelText: translator.translate('name'),
                labelStyle: translator.currentLanguage == 'en'
                    ? TextStyle(
                        color: Color(0XFF1a73e9),
                      )
                    : widget.textStyleDesAr,
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),

              textCapitalization: TextCapitalization.sentences,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Text(
                        translator.translate('linke'),
                        style: translator.currentLanguage == 'en'
                            ? TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)
                            : widget.textStyleTitleAr,
                      )),
                    )),
                SizedBox(
                  width: 8,
                ),
                Container(
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                          new ClipboardData(text: 'http://muayadmohammed.com'));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Text(
                        'http://muayadmohammed.com',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.blueGrey,
                child: Center(child: Text('QR Code')),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 6,
                  left: 6,
                  bottom: 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        translator.translate('cancel'),
                        style: translator.currentLanguage == 'en'
                            ? widget.textStyleDesEn
                            : widget.textStyleDesAr,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: 55,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              translator.translate('create'),
                              style: translator.currentLanguage == 'en'
                                  ? widget.textStyleDesEn
                                  : widget.textStyleDesAr,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
