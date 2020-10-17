import '../../../components/route.dart';
import '../../../screens/home_work/Student/Missing.dart';
import '../../../screens/home_work/Student/complete.dart';
import '../../../screens/home_work/Student/required.dart';
import '../../../util/data.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import '../../navigation_drawer.dart';
import 'add_task.dart';
import 'task.dart';
import 'package:flutter/material.dart';
import 'done.dart';

class HomeTasks extends StatefulWidget {
  TextStyle textStyleTitleEn, textStyleDesEn, textStyleTitleAr, textStyleDesAr;
  bool teacher;
  HomeTasks({
    @required this.textStyleTitleEn,
    @required this.textStyleDesEn,
    @required this.textStyleTitleAr,
    @required this.textStyleDesAr,
    @required this.teacher,
  });
  @override
  _HomeTasksState createState() => _HomeTasksState();
}

class _HomeTasksState extends State<HomeTasks>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      initialIndex: 0,
      length: widget.teacher ? 2 : 3,
    );
  }

  int x = 90;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: widget.teacher
          ? AppBar(
              title: Text(
                translator.translate('titleTask'),
                style: translator.currentLanguage == 'en'
                    ? widget.textStyleTitleEn
                    : widget.textStyleTitleAr,
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.lightBlue,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      SlideRightRoute(
                        widget: AddTask(
                          textStyleTitleEn: widget.textStyleTitleEn,
                          textStyleDesEn: widget.textStyleDesEn,
                          textStyleTitleAr: widget.textStyleTitleAr,
                          textStyleDesAr: widget.textStyleDesAr,
                        ),
                      ),
                    );
                  },
                ),
              ],
              centerTitle: true,
              elevation: 4,
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Theme.of(context).accentColor,
                labelColor: Theme.of(context).accentColor,
                unselectedLabelColor: Theme.of(context).textTheme.caption.color,
                isScrollable: false,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      translator.translate("tasks"),
                      style: translator.currentLanguage == 'en'
                          ? widget.textStyleDesEn
                          : widget.textStyleDesAr,
                    ),
                  ),
                  Tab(
                    child: Text(
                      translator.translate("done"),
                      style: translator.currentLanguage == 'en'
                          ? widget.textStyleDesEn
                          : widget.textStyleDesAr,
                    ),
                  ),
                ],
              ),
            )
          : AppBar(
              title: Text(
                translator.translate('homeWork'),
                style: translator.currentLanguage == 'en'
                    ? widget.textStyleTitleEn
                    : widget.textStyleTitleAr,
              ),
              centerTitle: true,
              elevation: 4,
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Theme.of(context).accentColor,
                labelColor: Theme.of(context).accentColor,
                unselectedLabelColor: Theme.of(context).textTheme.caption.color,
                isScrollable: false,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      translator.translate("required"),
                      style: translator.currentLanguage == 'en'
                          ? widget.textStyleDesEn
                          : widget.textStyleDesAr,
                    ),
                  ),
                  Tab(
                    child: Text(
                      translator.translate("missing"),
                      style: translator.currentLanguage == 'en'
                          ? widget.textStyleDesEn
                          : widget.textStyleDesAr,
                    ),
                  ),
                  Tab(
                    child: Text(
                      translator.translate("complete"),
                      style: translator.currentLanguage == 'en'
                          ? widget.textStyleDesEn
                          : widget.textStyleDesAr,
                    ),
                  ),
                ],
              ),
            ),
      drawer: NavigationDrawer(),
      body: widget.teacher
          ? TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 0.5,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Divider(),
                      ),
                    );
                  },
                  itemCount: chats.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Task(
                      textStyleTitleAr: widget.textStyleTitleAr,
                      textStyleDesAr: widget.textStyleDesAr,
                      textStyleDesEn: widget.textStyleDesEn,
                      textStyleTitleEn: widget.textStyleTitleEn,
                    );
                  },
                ),
                ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 0.5,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Divider(),
                      ),
                    );
                  },
                  itemCount: active.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Done(
                      teacher: widget.teacher,
                      textStyleTitleAr: widget.textStyleTitleAr,
                      textStyleDesAr: widget.textStyleDesAr,
                      textStyleTitleEn: widget.textStyleTitleEn,
                      textStyleDesEn: widget.textStyleDesEn,
                    );
                  },
                ),
              ],
            )
          : TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView.separated(
                  padding: EdgeInsets.all(10),
                  separatorBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 0.5,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Divider(),
                      ),
                    );
                  },
                  itemCount: chats.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Required(
                      textStyleTitleAr: widget.textStyleTitleAr,
                      textStyleDesAr: widget.textStyleDesAr,
                      textStyleTitleEn: widget.textStyleTitleEn,
                      textStyleDesEn: widget.textStyleDesEn,
                    );
                  },
                ),
                ListView.separated(
                  padding: EdgeInsets.all(10),
                  separatorBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 0.5,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Divider(),
                      ),
                    );
                  },
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Misssing(
                      textStyleTitleAr: widget.textStyleTitleAr,
                      textStyleDesAr: widget.textStyleDesAr,
                      textStyleTitleEn: widget.textStyleTitleEn,
                      textStyleDesEn: widget.textStyleDesEn,
                    );
                  },
                ),
                ListView.separated(
                  padding: EdgeInsets.all(10),
                  separatorBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 0.5,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: Divider(),
                      ),
                    );
                  },
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    Map activee = active1[index];
                    return Complete(
                      counter: activee['counter'],
                      textStyleTitleAr: widget.textStyleTitleAr,
                      textStyleDesAr: widget.textStyleDesAr,
                      textStyleTitleEn: widget.textStyleTitleEn,
                      textStyleDesEn: widget.textStyleDesEn,
                    );
                  },
                ),
              ],
            ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
