import 'package:finalApp/util/data.dart';
import 'package:flutter/material.dart';

class Misssing extends StatefulWidget {
  TextStyle textStyleTitle, textStyleDes;
  Misssing({
    @required this.textStyleTitle,
    @required this.textStyleDes,
  });
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
        itemCount: 10, //task.length,
        itemBuilder: (BuildContext ctxt, int index) {
          Map tasks = task[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      tasks['dp'],
                    ),
                    radius: 25,
                  ),
                  contentPadding: EdgeInsets.all(0),
                  title: Container(
                      width: size.width / 3.5,
                      child: Text(tasks['name'], style: widget.textStyleDes)),
                  trailing: Container(
                      width: size.width / 3.5,
                      child: Text(tasks['subj'],
                          textAlign: TextAlign.center,
                          style: widget.textStyleDes)),
                  onTap: () {



print('momo');
                    
                  },
                ),
                Divider(
                  endIndent: 0,
                  indent: 0,
                  height: 0,
                ),
              ],
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
            ),
          );
        },
      ),
    );
  }
}
