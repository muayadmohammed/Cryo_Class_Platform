import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Comment extends StatefulWidget {
  final TextStyle textStyleTitle, textStyleDes;
  Comment({
    @required this.textStyleTitle,
    @required this.textStyleDes,
  });
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('comment'),
          style: widget.textStyleTitle,
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Divider(
                    height: 0,
                    color: Colors.black54,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    // height: 500,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0XFFECEFF0),
                      ),
                      child: SingleChildScrollView(
                        child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 30,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        // height: 94,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15,right: 15),
                                              child: CircleAvatar(
                                                  backgroundColor: Colors.blue,
                                                  backgroundImage: AssetImage(
                                                    "assets/cm9.jpeg",
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 7),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Container(
                                                    width: size.width / 2.2,
                                                    child: Text(
                                                      translator.translate(
                                                          'nameofStudent'),
                                                      style:
                                                          widget.textStyleDes,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Container(
                                                    width: size.width / 2.2,
                                                    child: Text(
                                                      translator.translate(
                                                              "Description") +
                                                          '\nيكبر ويصغر حسب المحتوى',
                                                      style:
                                                          widget.textStyleDes,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              // alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10, bottom: 0,left: 10),
                                                child: Text('12:09 AM',
                                                    style: widget.textStyleDes
                                                    // TextStyle(
                                                    //     color:
                                                    //         Color(0XFF798186),
                                                    //     fontSize: 12),
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 3,
                  right: 10,
                  left: 10,
                  child: Container(
                    width: size.width,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Color(0XFF87CEFA).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: TextField(
                          textAlign: TextAlign.right,
                          cursorColor: Colors.white,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText:  translator.translate('comment'),
                            hintStyle: widget.textStyleDes,
                            // TextStyle(
                            //   color: Colors.black,
                            // ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Color(0XFF00CED1),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
