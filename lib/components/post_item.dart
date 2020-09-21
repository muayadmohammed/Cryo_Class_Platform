
import 'package:finalApp/screens/profile.dart';
import 'package:flutter/material.dart';

import 'PostItemInfo.dart';

class PostItem extends StatefulWidget {
  final String dp;
  final String name;

  PostItem({Key key, @required this.dp, @required this.name}) : super(key: key);
  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Profile())),
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  "${widget.dp}",
                ),
              ),
            ),

            contentPadding: EdgeInsets.all(0),
            title: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => Profile())),
              child: Text(
                "${widget.name}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // trailing: Text(
            //   "${widget.time}",
            //   style: TextStyle(
            //     fontWeight: FontWeight.w300,
            //     fontSize: 11,
            //   ),
            // ),
          ),

          // Image.asset(
          //   "${widget.img}",
          //   height: 170,
          //   width: MediaQuery.of(context).size.width,
          //   fit: BoxFit.cover,
          // ),

          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PostItemInfo()));
            },
            child: Container(
              height: 130,
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
                      'Subject Name',
                      // style: widget._stylePagesTitle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Teachers name',
       
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
