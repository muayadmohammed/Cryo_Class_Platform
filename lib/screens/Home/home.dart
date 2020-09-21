import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../navigation_drawer.dart';
import 'Comment.dart';
import 'add_subject.dart';

class Home extends StatefulWidget {
  TextStyle textStyleTitle, textStyleDes, textStyleSearch;
  Home(
      {@required this.textStyleTitle,
      @required this.textStyleDes,
      @required this.textStyleSearch});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  bool like = false;
  void _incrementCounter() {
    setState(() {
      like = true;
      _counter++;
    });
  }

  Future<void> _launched;
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Class',
          style: widget.textStyleTitle,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2,bottom: 5,top: 5 ),
            child: Container(
          
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200],
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.lightBlue,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => AddSubject(
                            // textStyleTitle: widget.textStyleTitle,
                            // textStyleDes: widget.textStyleDes,
                            )));
                  }),
            ),
          )
        ],
        elevation: 5,
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Conteant(
            "Subject Name",
            'Description',
            'https://www.google.com/',
            false,
          );
        },
      ),
    );
  }

  Widget Conteant(String t, String Desc, String file, bool ffile) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 5),
              child: Text(t,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  )),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(right: 5, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    Desc,
                    style: widget.textStyleDes,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      _launched = _launchInBrowser(file);
                    }),
                    child: Text(
                      ffile ? file : '',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 0, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '$_counter ',
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                  color: like ? Colors.green : Colors.grey,
                                ),
                                onPressed: () {
                                  _incrementCounter();
                                }),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Comment(
                                      textStyleTitle: widget.textStyleTitle,
                                      textStyleDes: widget.textStyleDes,
                                    )));
                          },
                          child: Row(
                            children: [
                              Text(
                                '1',
                              ),
                              Text(
                                ' Comment',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
