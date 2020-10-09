import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../../navigation_drawer.dart';

class ListTasks extends StatefulWidget {
  TextStyle textStyleTitleEn, textStyleDesEn, textStyleTitleAr, textStyleDesAr;
  ListTasks({
    @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
  });
  @override
  _ListTasksState createState() => _ListTasksState();
}

class _ListTasksState extends State<ListTasks> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          translator.translate('task'),
          style: translator.currentLanguage == 'en'
              ? widget.textStyleTitleEn
              : widget.textStyleTitleAr,
        ),
        centerTitle: true,
        elevation: 4,
      ),
      drawer: NavigationDrawer(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: Container(
          width: size.width,
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 180
              : 140,
          decoration: BoxDecoration(
            color: Colors.white, //(0XFF667EEA),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500],
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: size.width,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 90
                        : 76,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                       translator.translate('files'),
                        style: translator.currentLanguage == 'en'
                            ? widget.textStyleDesEn
                            : widget.textStyleDesAr,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              icon: Icon(Icons.camera_alt), onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.file_upload), onPressed: () {}),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // Divider(
              //   height:00,
              //   color: Colors.grey,
              // ),
              Container(
                width: size.width,
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 90
                        : 64,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.2, color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: InkWell(
                  onTap: () {
                    for (int momo = 10; momo >= 0; momo--) {
                      print('momo  $momo');
                    }
                  },
                  child: Center(
                    child: Text(
                      translator.translate('submit'),
                      style: translator.currentLanguage == 'en'
                          ? TextStyle(
                              color: Colors.blueAccent[700],
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                            )
                          : widget.textStyleDesAr, //widget.textStyleTitle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
        child: Container(
            child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500],
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
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 8, bottom: 5,right: 8),
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
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // width: size.width / 2 - 18,

                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, bottom: 5, right: 10,left: 10,),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment:
                                translator.currentLanguage == 'en'
                                    ? CrossAxisAlignment.start
                                    : CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text('12:00 AM'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('12/2/2021'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('12:00 AM'),
                          SizedBox(
                            height: 5,
                          ),
                          Text('20/2/2021'),
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
      ),
    );
  }
}
