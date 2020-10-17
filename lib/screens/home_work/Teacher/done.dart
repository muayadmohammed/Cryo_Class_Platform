import '../../../components/route.dart';
import '../../../util/data.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'evaluation.dart';

class Done extends StatefulWidget {
  TextStyle textStyleTitleEn, textStyleDesEn, textStyleTitleAr, textStyleDesAr;
  Done({
    @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
  });
  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10, //task.length,
        itemBuilder: (BuildContext ctxt, int index) {
          Map tasks = task[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      tasks['dp'],
                    ),
                    radius: 25,
                  ),
                  contentPadding: EdgeInsets.all(0),
                  title: Container(
                    width: size.width / 3.5,
                    child: Text(
                      tasks['name'],
                      style: translator.currentLanguage == 'en'
                          ? widget.textStyleTitleEn
                          : widget.textStyleTitleAr,
                    ),
                  ),
                  trailing: Container(
                    width: size.width / 3.5,
                    child: Text(
                      tasks['subj'],
                      textAlign: TextAlign.center,
                      style: translator.currentLanguage == 'en'
                          ? widget.textStyleTitleEn
                          : widget.textStyleTitleAr,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        widget: Evaluation(
                          textStyleDesAr: widget.textStyleDesAr,
                          textStyleTitleAr: widget.textStyleTitleAr,
                          textStyleTitleEn: widget.textStyleTitleEn,
                          textStyleDesEn: widget.textStyleDesEn,
                        ),
                      ),
                    );
                  },
                ),
                Divider(
                  endIndent: 0,
                  indent: 0,
                  height: 0,
                ),
              ],
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          );
        },
      ),
    );
  }
}

class PageRoute extends PageRouteBuilder {
  final Widget widget;

  PageRoute(this.widget)
      : super(
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secAnimation,
            Widget child,
          ) {
            animation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInQuad,
            );
            return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: child,
            );
          },
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secAnimation,
          ) {
            return widget;
          },
        );
}
