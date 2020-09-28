import 'package:flutter/material.dart';


class Task extends StatefulWidget {
  TextStyle textStyleTitle, textStyleDes;
  Task({
    @required this.textStyleTitle,
    @required this.textStyleDes,
  });

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 30,
            itemBuilder: (BuildContext ctxt, int index) {
              return Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: size.height / 5,
                    // width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
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
                          width: size.width - 113,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, left: 8, bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Subject .....',
                                  // style: widget.textStyleDes,
                                  textAlign: TextAlign.start,
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
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, right: 10),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                // Text(
                                //   '12:00 AM',
                                //   // style: widget.textStyleDes,
                                // ),
                                // SizedBox(
                                //   height: 10,
                                // ),
                                // // Divider(),
                                // Text(
                                //   '12/2/2021',
                                //   // style: widget.textStyleDes,
                                // ),
                                // SizedBox(
                                //   height: 10,
                                // ),

                                Text(
                                  '20/2/2021',
                                  // style: widget.textStyleDes,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '12:00 AM',
                                  // style: widget.textStyleDes,
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
                  ),
                ],
              ));
            }));
  }
}
