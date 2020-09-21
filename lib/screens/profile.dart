
import 'package:flutter/material.dart';

import 'Auth/Login.dart';
import 'NavigationDrawer.dart';
import 'chat/conversation.dart';

class Profile extends StatefulWidget {
  @override
  Profile_State createState() => Profile_State();
}

class Profile_State extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
        drawer: NavigationDrawer(),
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? new Stack(
                children: <Widget>[
                  // Scaffold(
                  //   appBar: AppBar(

                  //   ),
                  // ),
                  // Container(
                  //   height: 300,
                  //   width: MediaQuery.of(context).size.width,
                  //   color: Colors.red,

                  // ),
                  ClipPath(
                    child: Container(
                      color: Colors.black.withOpacity(0.8),
                    ),
                    clipper: getClipper(),
                  ),
                  Positioned(
                      width: 350.0,
                      top: MediaQuery.of(context).size.height / 5,
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                    image: ExactAssetImage("assets/cm0.jpeg"),
                                    // NetworkImage(
                                    // 'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(75.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7.0, color: Colors.black)
                                  ])),
                          SizedBox(height: 70.0),
                          Text(
                            'Muayad Mohammed',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Stage : ',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          // fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'Fourth',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 15.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Email : ',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          // fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'muayadmohammed3@gmail.com',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 15.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Password : ',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          // fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '*******',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 35.0),
                          /*
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Edit Name',
                            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                   */
                          // SizedBox(height: 25.0),
                          GestureDetector(
                            onTap: () {
                             
                                Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>Conversation()));
                            },
                            child: Container(
                                height: 40.0,
                                width: 100.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.blueGrey,
                                  color: Colors.grey,
                                  elevation: 7.0,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.chat),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'Chat',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Montserrat'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(height: 25.0),
                          Container(
                              height: 40.0,
                              width: 95.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.redAccent,
                                color: Colors.red,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>Login ())); 
                                  },
                                  child: Center(
                                    child: Text(
                                      'Log out',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ))
                ],
              )
            : ListView(
                children: <Widget>[
                  // Scaffold(
                  //   appBar: AppBar(

                  //   ),
                  // ),
                  // Container(
                  //   height: 300,
                  //   width: MediaQuery.of(context).size.width,
                  //   color: Colors.red,

                  // ),
                  ClipPath(
                    child: Container(
                      color: Colors.black.withOpacity(0.8),
                    ),
                    clipper: getClipper(),
                  ),
                  Positioned(
                      width: 350.0,
                      top: MediaQuery.of(context).size.height / 5,
                      child: Column(
                        children: <Widget>[
                          Container(
                              width: 150.0,
                              height: 150.0,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                    image: ExactAssetImage("assets/cm0.jpeg"),
                                    // NetworkImage(
                                    // 'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(75.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 7.0, color: Colors.black)
                                  ])),
                          SizedBox(height: 70.0),
                          Text(
                            'Muayad Mohammed',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat'),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Stage : ',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          // fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'Fourth',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 15.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Email : ',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          // fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      'muayadmohammed3@gmail.com',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 15.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Password : ',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          // fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '*******',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: 'Montserrat'),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(height: 35.0),
                          /*
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.greenAccent,
                      color: Colors.green,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Edit Name',
                            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                   */
                          // SizedBox(height: 25.0),
                          GestureDetector(
                            onTap: () {
                              print('muayad');
                            },
                            child: Container(
                                height: 40.0,
                                width: 100.0,
                                child: Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shadowColor: Colors.blueGrey,
                                  color: Colors.grey,
                                  elevation: 7.0,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.chat),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'Chat',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Montserrat'),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(height: 25.0),
                          Container(
                              height: 40.0,
                              width: 95.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.redAccent,
                                color: Colors.red,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {
                                   Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>Login ()));  
                                  },
                                  child: Center(
                                    child: Text(
                                      'Log out',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ))
                ],
              ));
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
