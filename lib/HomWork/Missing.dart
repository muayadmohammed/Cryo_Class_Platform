import 'package:flutter/material.dart';

class Misssing extends StatefulWidget {
  @override
  _MisssingState createState() => _MisssingState();
}

class _MisssingState extends State<Misssing> {
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
                ));
            })
      
    );
  }
}