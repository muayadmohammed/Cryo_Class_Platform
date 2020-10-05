import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateClass extends StatefulWidget {
  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Class'),
        centerTitle: true,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                // hintText: 'Name',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF1a73e9),
                    width: 1.5,
                  ),
                ),
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Color(0XFF1a73e9),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),

              textCapitalization: TextCapitalization.sentences,
              // onChanged: (text) => setState(() {}),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                    height: 40,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Text(
                        'Linke ',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 20),
                      )),
                    )),
                SizedBox(
                  width: 8,
                ),
                Container(
                  height: 40,
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 0,
                  //   ),
                  // ),
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                          new ClipboardData(text: 'http://muayadmohammed.com'));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                          child: Text(
                        'http://muayadmohammed.com',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        textAlign: TextAlign.center,
                      )),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.blueGrey,
                child: Center(child: Text('QR Code')),
              ),
            ),
            SizedBox(
              height: 30,
            ),   Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 6,
                    bottom: 3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancel',
                          // style: widget.textStyleDes,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 55,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Create ',
                                // style: widget.textStyleDes,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
          ],
        ),
      ),
    );
  }
}
