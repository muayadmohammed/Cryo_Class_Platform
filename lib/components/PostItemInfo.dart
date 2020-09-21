
import 'package:finalApp/util/data.dart';
import 'package:flutter/material.dart';

import 'PostItemInfo2.dart';

class PostItemInfo extends StatefulWidget {
  @override
  _PostItemInfoState createState() => _PostItemInfoState();
}

class _PostItemInfoState extends State<PostItemInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text('Subject'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
 
          return PostItemInfo2();
        },
      ),
    );
  }
}
