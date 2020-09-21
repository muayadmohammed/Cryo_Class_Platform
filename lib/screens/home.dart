
import 'package:finalApp/components/post_item.dart';
import 'package:finalApp/util/data.dart';
import 'package:flutter/material.dart';

import 'NavigationDrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Feeds"),
      //   centerTitle: true,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(
      //         Icons.filter_list,
      //       ),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      appBar: AppBar(
        title:    TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            
          ),
      
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(
        //       Icons.filter_list,
        //     ),
        //     onPressed: () {},
        //   ),
        // ],
      
      ),
      
      drawer: 
      NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount:10,// posts.length,
        itemBuilder: (BuildContext context, int index) {
          Map post = posts[index];
          return PostItem(
            // img: post['img'],
            name: post['name'],
            dp: post['dp'],
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {},
      // ),
    );
  }
}