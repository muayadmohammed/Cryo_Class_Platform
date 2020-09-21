
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main_screen.dart';
import 'components/Background.dart';
import 'components/CustomInputFeild.dart';

class Login extends StatefulWidget {
  // bool isLoading;
  // Login({this.isLoading});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  // bool isLoading = true;

  // @override
  // void initState() {
  //   super.initState();

  //   Future.delayed(const Duration(seconds: 5), () {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // if (isLoading == true) {
    //   return Loading();
    // } else {
      return Background(
        size: size,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    "Log in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                CustomInputField(
                  hint: "Email",
                  size: size,
                  prefixIcon: Icons.email,
                ),
                CustomInputField(
                  hint: "Password",
                  size: size,
                  prefixIcon: Icons.lock,
                  obscure: true,
                ),
                SizedBox(height: 55),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ),
                          );
                        },
                        padding: EdgeInsets.all(20),
                        color: Color(0xFF0b132b),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 45,
                        ),
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      );
    }
  // }
}
