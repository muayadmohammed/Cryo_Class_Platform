import 'dart:math';

import 'package:finalApp/util/data.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../chat/chat_bubble.dart';
import '../profile.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  TextStyle textStyleDesEn, textStyleDesAr;
  Conversation({
    @required this.textStyleDesEn,
    @required this.textStyleDesAr,
  });
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  static Random random = Random();
  String name = names[random.nextInt(10)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: InkWell(
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/cm${random.nextInt(10)}.jpeg",
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            )
                    ),
                    SizedBox(height: 5),
                    Text(
                      translator.translate("online"),
                      style: translator.currentLanguage == 'en'
                          ? TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            )
                          : TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            )
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return Profile(
                    textStyleDesEn: widget.textStyleDesEn,
                    textStyleDesAr: widget.textStyleDesAr,
                  );
                },
              ),
            );
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: conversation.length,
                reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  Map msg = conversation[index];
                  return ChatBubble(
                    message: msg['type'] == "text"
                        ? messages[random.nextInt(10)]
                        : "assets/cm${random.nextInt(10)}.jpeg",
                    username: msg["username"],
                    time: msg["time"],
                    type: msg['type'],
                    replyText: msg["replyText"],
                    isMe: msg['isMe'],
                    isGroup: msg['isGroup'],
                    isReply: msg['isReply'],
                    replyName: name,
                    textStyleDes: translator.currentLanguage == 'en'
                        ? widget.textStyleDesEn
                        : widget.textStyleDesAr,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomAppBar(
                elevation: 10,
                color: Theme.of(context).primaryColor,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 100,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_voice,
                          color: Theme.of(context).accentColor,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.photo_camera,
                          color: Theme.of(context).accentColor,
                        ),
                        onPressed: () {
                          //       Navigator.of(context).push(MaterialPageRoute(
                          // builder: (BuildContext context) => (

                          //     )));
                        },
                      ),
                      Flexible(
                        child: TextField(
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Theme.of(context).textTheme.title.color,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: translator.translate("writeYourMessage"),
                            hintStyle: translator.currentLanguage == 'en'
                                ? widget.textStyleDesEn
                                : widget.textStyleDesAr,
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Theme.of(context).accentColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          maxLines: null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
