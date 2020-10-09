import 'package:finalApp/components/route.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'list_tasks.dart';

class Required extends StatefulWidget {
  TextStyle textStyleTitleEn, textStyleDesEn, textStyleTitleAr, textStyleDesAr;
  Required({
    @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
  });

  @override
  _RequiredState createState() => _RequiredState();
}

class _RequiredState extends State<Required> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 30,
        itemBuilder: (BuildContext ctxt, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                SlideRightRoute(
                  widget: ListTasks(
                       textStyleTitleAr: widget.textStyleTitleAr,
                      textStyleDesAr: widget.textStyleDesAr,
                      textStyleTitleEn: widget.textStyleTitleEn,
                      textStyleDesEn: widget.textStyleDesEn,
                  ),
                ),
              );
            },
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // width: size.width - 113,

                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 8, bottom: 5, right: 8),
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
                                textAlign: TextAlign.start,
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
                            crossAxisAlignment:
                                translator.currentLanguage == 'en'
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '12:00 AM',
                                style: translator.currentLanguage == 'en'
                                    ? widget.textStyleDesEn
                                    : widget.textStyleDesAr,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '12/2/2021',
                                style: translator.currentLanguage == 'en'
                                    ? widget.textStyleDesEn
                                    : widget.textStyleDesAr,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '12:00 AM',
                                style: translator.currentLanguage == 'en'
                                    ? widget.textStyleDesEn
                                    : widget.textStyleDesAr,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '20/2/2021',
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
                    ],
                  ),
                )
              ],
            )),
          );
        });
  }
}
