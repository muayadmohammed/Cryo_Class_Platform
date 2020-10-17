import '../../components/route.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../chat/conversation.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatefulWidget {
  final String dp;
  final String name;
  final String time;
  final String msg;
  final bool isOnline;
  final int counter;
  bool teacher;
  TextStyle textStyleTitleEn, textStyleDesEn, textStyleTitleAr, textStyleDesAr;

  ChatItem({
    Key key,
    @required this.dp,
    @required this.name,
    @required this.time,
    @required this.msg,
    @required this.isOnline,
    @required this.counter,
    @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
    @required this.teacher,
  }) : super(key: key);

  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Stack(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(
              "${widget.dp}",
            ),
            radius: 25,
          ),
          Positioned(
            bottom: 0.0,
            left: 6.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              height: 11,
              width: 11,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.isOnline ? Colors.greenAccent : Colors.grey,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  height: 7,
                  width: 7,
                ),
              ),
            ),
          ),
        ],
      ),
      title: Text(
        "${widget.name}",
        maxLines: 1,
        style: translator.currentLanguage == 'en'
            ? widget.textStyleTitleEn
            : widget.textStyleTitleAr,
      ),
      subtitle: Text(
        "${widget.msg}",
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "${widget.time}",
            style: translator.currentLanguage == 'en'
                ? widget.textStyleDesEn
                : widget.textStyleDesAr,
          ),
          widget.counter == 0
              ? SizedBox()
              : Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 11,
                    minHeight: 11,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 1, left: 5, right: 5),
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
      onTap: () {
        Navigator.push(
          context,
          SlideRightRoute(
            widget: Conversation(
              textStyleDesEn: widget.textStyleDesEn,
              textStyleDesAr: widget.textStyleDesAr,
              teacher:widget.teacher,
            ),
          ),
        );
      },
    );
  }
}
