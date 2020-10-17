import 'package:google_fonts_arabic/fonts.dart';
import 'home_work/Teacher/home_tasks.dart';
import '../components/icon_badge.dart';
import 'profile.dart';
import 'package:flutter/material.dart';
import 'chat/chats.dart';
import 'Home/Teacher/home.dart';
import 'notifications.dart';

class MainScreen extends StatefulWidget {
  final bool teacher;
  MainScreen({this.teacher});
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
            teacher:widget.teacher,
            textStyleTitleEn: textStyleTitleEn,
            textStyleDesEn: textStyleDesEn,
            textStyleSearchEn: textStyleSearchEn,
            textStyleTitleAr: textStyleTitleAr,
            textStyleDesAr: textStyleDesAr,
            textStyleSearchAr: textStyleSearchAr,
          ),
          HomeTasks(
            teacher: widget.teacher,
            textStyleTitleAr: textStyleTitleAr,
            textStyleDesAr: textStyleDesAr,
            textStyleTitleEn: textStyleTitleEn,
            textStyleDesEn: textStyleDesEn,
          ),
          Home(
            teacher:widget.teacher,
            textStyleTitleAr: textStyleTitleAr,
            textStyleDesAr: textStyleDesAr,
            textStyleSearchAr: textStyleSearchAr,
            textStyleTitleEn: textStyleTitleEn,
            textStyleDesEn: textStyleDesEn,
            textStyleSearchEn: textStyleSearchEn,
          ),
          Notifications(
            teacher:widget.teacher,
            textStyleTitleAr: textStyleTitleAr,
            textStyleDesAr: textStyleDesAr,
            textStyleTitleEn: textStyleTitleEn,
            textStyleDesEn: textStyleDesEn,
          ),
          Profile(
            teacher: widget.teacher,
            textStyleDesEn: textStyleDesEn,
            textStyleDesAr: textStyleDesAr,
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
