import 'package:google_fonts_arabic/fonts.dart';

import 'home_work/home_tasks.dart';
import '../components/icon_badge.dart';
import 'profile.dart';
import 'package:flutter/material.dart';

import 'chat/chats.dart';
import 'Home/home.dart';
import 'notifications.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 2;
  TextStyle textStyleTitleEn = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );
  TextStyle textStyleSearchEn = TextStyle(
    color: Colors.grey[600],
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontFamily: 'Montserrat',
  );
  TextStyle textStyleDesEn = TextStyle(
    color: Colors.grey[800],
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );
     TextStyle textStyleTitleAr = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: Colors.black,
      fontFamily: ArabicFonts.Cairo,
      package: 'google_fonts_arabic',
    );
    TextStyle textStyleSearchAr = TextStyle(
      fontFamily: ArabicFonts.Cairo,
      package: 'google_fonts_arabic',
      fontWeight: FontWeight.w300,
      color: Colors.grey[600],
      fontSize: 16,
    );
    TextStyle textStyleDesAr = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.grey[800],
      fontFamily: ArabicFonts.Changa,
      package: 'google_fonts_arabic',
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Chats(
            textStyleTitle: textStyleTitleAr,
            textStyleDes: textStyleDesAr,
            textStyleSearch: textStyleSearchAr,
          ),
          HomeTasks(
            textStyleTitle: textStyleTitleAr,
            textStyleDes: textStyleDesAr,
          ),
          Home(
            textStyleTitle: textStyleTitleAr,
            textStyleDes: textStyleDesAr,
            textStyleSearch: textStyleSearchAr,
          ),
          Notifications(
            textStyleTitle: textStyleTitleAr,
            textStyleDes: textStyleDesAr,
          ),
          Profile(
            textStyleDes: textStyleDesAr,
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
          primaryColor: Theme.of(context).accentColor,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.grey[500]),
              ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: IconBadge(
                icon: Icons.notifications,
              ),
              title: Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Container(height: 0.0),
            ),
          ],
          onTap: navigationTapped,
          currentIndex: _page,
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
