
import '../../../util/data.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Complete extends StatefulWidget {
  final int counter;
  TextStyle textStyleTitleEn, textStyleDesEn, textStyleTitleAr, textStyleDesAr;
  Complete({
    @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
    @required this.counter,
  });
  @override
  _CompleteState createState() => _CompleteState();
}

int dgree = random.nextInt(10);

class _CompleteState extends State<Complete> {
  @override
  Widget build(BuildContext context) {
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
                      width: MediaQuery.of(context).size.width / 1.7,
                      margin: EdgeInsets.all(20),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, left: 8, bottom: 5, right: 8),
                        child: Text(
                          translator.translate('name'),
                          style: translator.currentLanguage == 'en'
                              ? widget.textStyleDesEn
                              : widget.textStyleDesAr,
                        ),
                      ),
                    ),
                
                    widget.counter == 0
                        ? SizedBox()
                        : Container(
                            width: 30,
                            height: 30,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: _color(widget.counter)
                                  ? Colors.red
                                  : Colors.cyan,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 11,
                              minHeight: 11,
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: 1, left: 5, right: 5),
                              child: Text(
                                "${widget.counter}",
                                style: translator.currentLanguage == 'en'
                                    ? widget.textStyleDesEn
                                    : widget.textStyleDesAr,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  bool _color(int drgree) {
    if (drgree > 4) {
      return false;
    } else {
      return true;
    }
  }
}
