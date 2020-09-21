import 'dart:ui';
import 'package:flutter/material.dart';

class AddSubject extends StatefulWidget {
  @override
  _AddSubjectState createState() => _AddSubjectState();
}

class _AddSubjectState extends State<AddSubject> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Subject'),
        elevation: 5,
        centerTitle: true,
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                // height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      // height: 30,
                      width: size.width - 10,
                      // color: Colors.cyan,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Subject Name...',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            // hintStyle: widget.textStyleSearch,
                          ),
                        ),
                 
                      ),
                    ),
                    Divider(),
                   
                    Container(
                      // height: 30,
                      width: size.width - 10,
                      // color: Colors.cyan,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: 
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Description...',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            // hintStyle: widget.textStyleSearch,
                          ),
                        ),
                      ),
                    ),
                  
                    Divider(),
                    Container(
                      height: 40,
                      width: size.width - 10,
                      // color: Colors.orange,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                icon: Icon(Icons.attach_file),
                                onPressed: () {}),
                            Container(
                                child: Row(
                              children: [
                                InkWell(onTap: () {}, child: Text('Cancel')),
                                SizedBox(
                                  width: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 45,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(child: Text('Post')),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
