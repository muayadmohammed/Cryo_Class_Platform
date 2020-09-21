
import 'package:flutter/material.dart';

import 'viweTask.dart';

class ChatItem extends StatefulWidget {


  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
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
              return InkWell(
                onTap: (){
                   Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (BuildContext context){
                return ViewTask();
              },
            ),
          );
                },
                              child: Container(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: size.height / 5,
                      // width: 100,
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
                        children: [
                          Container(
                            // height: 100,
                            width: size.width / 2 - 18,
                            decoration: BoxDecoration(
                              // color: Colors.redAccent,
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
                                  Text('Name '),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Dec ....'),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: size.width / 2 - 18,
                            decoration: BoxDecoration(
                              // color: Colors.blueGrey,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('12:00 AM'),
                                  Text('12/2/2021'),
                                  Text('12:00 AM'),
                                  Text('20/2/2021'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
              );
            })

        /*ListTile(
        contentPadding: EdgeInsets.all(0),
       /*
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
                      color: widget.isOnline
                          ?Colors.greenAccent
                          :Colors.grey,
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
*/
        title: Text(
          "${widget.name}",
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "${widget.msg}",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              "12:00 AM",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 11,
              ),
            ),

            SizedBox(height: 5),
            widget.counter == 0
                ?SizedBox()
                :Container(
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
                child:Text(
                  "${widget.counter}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        onTap: (){
          // Navigator.of(context, rootNavigator: true).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context){
          //       return ;
          //     },
          //   ),
          // );
        },
      ),*/
        );
  }
}
