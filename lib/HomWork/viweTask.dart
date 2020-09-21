
import 'package:finalApp/screens/NavigationDrawer.dart';
import 'package:flutter/material.dart';


class ViewTask extends StatefulWidget {
  @override
  _ViewTaskState createState() => _ViewTaskState();
}

class _ViewTaskState extends State<ViewTask> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
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
                height: MediaQuery.of(context).orientation == Orientation.portrait
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
                      Text('Upload Files'),
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
                height: MediaQuery.of(context).orientation == Orientation.portrait
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
                  onTap: () {},
                  child: Center(
                    child: Text('Submit'),
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
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? size.height / 3.5
                  : size.height / 2, // width: 100,

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
                    width: size.width / 2 - 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0)),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 8, bottom: 5),
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
                      padding:
                          const EdgeInsets.only(top: 5, bottom: 5, right: 10),
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
      ),
    );
  }
}
