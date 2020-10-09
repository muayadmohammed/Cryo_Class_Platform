import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AddClass extends StatefulWidget {
  TextStyle textStyleTitleAr, textStyleDesAr, textStyleTitleEn, textStyleDesEn;
  AddClass({
    @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
  });
  @override
  _AddClassState createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('addClass'),
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
                // hintText: 'Name',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF1a73e9),
                    width: 1.5,
                  ),
                ),
                labelText: translator.translate('link'),
                labelStyle: TextStyle(
                  color: Color(0XFF1a73e9),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),

              textCapitalization: TextCapitalization.sentences,
              // onChanged: (text) => setState(() {}),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.blueGrey,
                  child: Center(child: Icon(Icons.qr_code)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 6,
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
                        onTap: () {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.LEFTSLIDE,
                            headerAnimationLoop: false,
                            dialogType: DialogType.SUCCES,
                            body: Column(
                              children: [
                                Text(
                                  translator.translate('success'),
                                  style: translator.currentLanguage == 'en'
                                      ? widget.textStyleTitleEn
                                      : widget.textStyleTitleAr,
                                ),
                                Text(
                                  translator.translate('approval'),
                                  style: translator.currentLanguage == 'en'
                                      ? widget.textStyleDesEn
                                      : widget.textStyleDesAr,
                                )
                              ],
                            ),
                            btnOkIcon: Icons.check_circle,
                          )..show();
                        },
                        child: Container(
                          width: 55,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              translator.translate('add'),
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
