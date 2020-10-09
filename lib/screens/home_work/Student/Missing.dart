import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Misssing extends StatefulWidget {
  TextStyle textStyleTitleEn, textStyleDesEn, textStyleTitleAr, textStyleDesAr;
  Misssing({
  @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
  });
  @override
  _MisssingState createState() => _MisssingState();
}

class _MisssingState extends State<Misssing> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 30,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
              child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                // width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), 
                    ),
                  ], 
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, left: 8, bottom: 5,right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              translator.translate('name'),
                            style: translator.currentLanguage == 'en'
                                ? widget.textStyleDesEn
                                : widget.textStyleDesAr,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              translator.translate('description'),
                            style: translator.currentLanguage == 'en'
                                ? widget.textStyleDesEn
                                : widget.textStyleDesAr,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      
                   
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment:  translator.currentLanguage == 'en'
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                          children: [  SizedBox(
                              height: 10,
                            ),
                        
                            Text('12:00 AM'),  SizedBox(
                              height: 5,
                            ),
                            Text('20/2/2021'),  SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ));
        });
  }
}
