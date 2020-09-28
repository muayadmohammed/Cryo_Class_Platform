import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class AddTask extends StatefulWidget {
    TextStyle textStyleTitle, textStyleDes;
  AddTask({
    @required this.textStyleTitle,
    @required this.textStyleDes,
  });
  @override
  _AddTaskState createState() => _AddTaskState();
}

TextEditingController dateCtl = TextEditingController();

class _AddTaskState extends State<AddTask> {
  String _date = '';
  String _time = '';

  TimeOfDay _timeOfDay = TimeOfDay.now();
  TimeOfDay _p;
  String s1 = 'AM';

  String s2 = 'PM';
  bool m = true;
  String _Hour = '';
  String _Main = '';
  var _intHour;
  Future<Null> slect(BuildContext context) async {
    _p = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
    );
    setState(() {
      _timeOfDay = _p;

      _Hour = _timeOfDay.hour.toString();
      _Main = _timeOfDay.minute.toString();

      _intHour = int.parse(_Hour);
      assert(_intHour is int);
      _time = Hour(_intHour) + ' : ' + _Main;
    });
  }

  String Hour(int _intHour) {
    if (_intHour >= 1 && _intHour <= 11 || _intHour == 00) {
      setState(() {
        m = true;
      });
      switch (_intHour) {
        case 1:
          return '1';
          break;
        case 2:
          return '2';
          break;
        case 3:
          return '3';
          break;
        case 4:
          return '4';
          break;
        case 5:
          return '5';
          break;
        case 6:
          return '6';
          break;
        case 7:
          return '7';
          break;
        case 8:
          return '8';
          break;
        case 9:
          return '9';
          break;
        case 10:
          return '10';
          break;
        case 11:
          return '11';
          break;
        case 00:
          return '12';
          break;
      }
    } else if (_intHour >= 12 && _intHour < 23) {
      setState(() {
        m = false;
      });
      switch (_intHour) {
        case 12:
          return '12 ';
          break;
        case 13:
          return '1';
          break;

        case 14:
          return '2';
          break;
        case 15:
          return '3';
          break;
        case 16:
          return '4';
          break;
        case 17:
          return '5';
          break;
        case 18:
          return '6';
          break;
        case 19:
          return '7';
          break;
        case 20:
          return '8';
          break;
        case 21:
          return '9';
          break;
        case 22:
          return '10';
          break;
        case 23:
          return '11';
          break;
      }
    }
  }

  final _controller = TextEditingController();

  Widget _buildMultilineTextField(String label, int line) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFF1a73e9),
            width: 1.5,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Color(0XFF1a73e9),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),

      maxLines: line,
      textCapitalization: TextCapitalization.sentences,
      // onChanged: (text) => setState(() {}),
    );
  }

  double _value = 0.0;
  void _setValue(double value) => setState(() => _value = value);

  static const double minValue = 0;
  static const double maxValue = 100;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Add New Task',style: widget.textStyleTitle,),
          centerTitle: true,
          elevation: 5,
          backgroundColor: Color(0XFF4286f5),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.attach_file,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        backgroundColor: Color(0XFFeeeeee),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8,
              bottom: 8,
              top: 12,
            ),
            child: ListView(children: [
              Container(
                child: _buildMultilineTextField('Subject', 1),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: _buildMultilineTextField('Description', 3),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Degree:        ${_value.toInt()}',
                      style: TextStyle(color: Color(0XFF4a4a4a))),
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
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      ).then((value) => {
                            setState(() {
                              DateFormat df = DateFormat.yMd();
                              this._date = df.format(value);
                            })
                          });
                    },
                    child: Container(
                      width: 45,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(child: Text('Date',style: 
                      widget.textStyleDes,)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(_date,style: widget.textStyleDes,),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      slect(context);
                    },
                    child: Container(
                      width: 45,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(child: Text('Time',style: widget.textStyleDes,)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(m
                      ? _timeOfDay.hour.toString() +
                          ' : ' +
                          _timeOfDay.minute.toString()
                      : _time + ' ',style: widget.textStyleDes,),
                  SizedBox(
                    width: 5,
                  ),
                  Text(m ? s1 : s2,style: widget.textStyleDes,),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(
                  right: 6,
                  bottom: 3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text('Cancel',style: widget.textStyleDes,),
                    ),
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
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(child: Text('Post',style: widget.textStyleDes,)),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ]),
          ),
        )
     
        );
  }
}
