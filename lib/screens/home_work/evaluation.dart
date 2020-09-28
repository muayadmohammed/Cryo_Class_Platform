import 'dart:ui';

import 'package:flutter/material.dart';

class Evaluation extends StatefulWidget {

     TextStyle textStyleTitle, textStyleDes;
  Evaluation({
    @required this.textStyleTitle,
    @required this.textStyleDes,
  });
  @override
  _EvaluationState createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
  double _value = 0.0;
  void _setValue(double value) => setState(() => _value = value);

  static const double minValue = 0;
  static const double maxValue = 100;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFFECEFF0),
      appBar: AppBar(
        elevation: 5,
        title: Text('Evaluation',style: widget.textStyleTitle,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          color: Color(0XFFECEFF0),
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: ListView(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Name ',style: widget.textStyleTitle,
                                // style: TextStyle(
                                //   fontSize: 20,
                                //   fontWeight: FontWeight.bold,
                                // ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Subject  ',style: widget.textStyleDes,
                                // style: TextStyle(
                                //   fontSize: 18,
                                //   fontWeight: FontWeight.w500,
                                // ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  height: 94,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    'هنا تعرض الملفات الي رفعها الطالب',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                    textAlign: TextAlign.center,
                                  )),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Degree:        ${_value.toInt()}',
                                    style: TextStyle(
                                      color: Color(0XFF4a4a4a),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Slider(
                                    value: _value,
                                    onChanged: _setValue,
                                    min: minValue,
                                    max: maxValue,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              Positioned(
                bottom: 3,
                right: 10,
                left: 10,
                child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white70, //(0XFFC0C0C0),
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black38,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.1, color: Colors.black)),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Cancel',
                                  // style: TextStyle(
                                  //   fontSize: 14,
                                  // )
                                  style: widget.textStyleDes,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Row(
                                children: [
                                  Text(
                                    'Send',
                                    // style: TextStyle(
                                    //     fontSize: 18, color: Colors.blue),
                                    style: widget.textStyleDes,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Icon(Icons.send,
                                      size: 18, color: Colors.blue),
                                ],
                              )),
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
