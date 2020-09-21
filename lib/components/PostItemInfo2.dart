import 'dart:ui';
import 'package:flutter/material.dart';
import 'Comment.dart';

class PostItemInfo2 extends StatefulWidget {
  @override
  _PostItemInfo2State createState() => _PostItemInfo2State();
}

class _PostItemInfo2State extends State<PostItemInfo2> {
  @override
  int _counter = 0;
  bool like = false;
  // Future<void> _launched;
  void _incrementCounter() {
    setState(() {
      like = true;
      _counter++;
    });
  }

  // Future<void> _launchInBrowser(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: false,
  //       forceWebView: false,
  //       headers: <String, String>{'my_header_key': 'my_header_value'},
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 5),
              child: Text(
                "Subject Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            // height: MediaQuery.of(context).size.height/4,
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
                    'Description',
                    // style: widget._stylePagesTitle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () => setState(() {
                      // _launched = _launchInBrowser('https://www.google.com/');
                    }),
                    child: Text(
                      'https://www.google.com/',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      // style: widget._stylePagesTitle, 
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
                                builder: (BuildContext context) => Comment1()));
                          },
                          child: Row(
                            children: [
                              Text(
                                '1',
                                // widget.listDruges[index].mapPharmacy[0]
                                //     ["PharmacyName"],
                                // style: widget._stylePagesSubTitle,
                              ),
                              Text(
                                ' Comment',
                                // widget.listDruges[index].mapPharmacy[0]
                                //     ["PharmacyName"],
                                // style: widget._stylePagesSubTitle,
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
