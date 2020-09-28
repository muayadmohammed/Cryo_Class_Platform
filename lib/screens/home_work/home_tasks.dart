import 'package:finalApp/screens/home_work/add_task.dart';

import 'task.dart';
import '../navigation_drawer.dart';

import 'package:finalApp/util/data.dart';
import 'package:flutter/material.dart';

import 'Missing.dart';

class HomeTasks extends StatefulWidget {
  TextStyle textStyleTitle, textStyleDes;
  HomeTasks({
    @required this.textStyleTitle,
    @required this.textStyleDes,
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
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Task',
          style: widget.textStyleTitle,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.lightBlue,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AddTask(
                        textStyleTitle: widget.textStyleTitle,
                        textStyleDes: widget.textStyleDes,
                        )));
              }),
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
              text: "Tasks",
            ),
            Tab(
              text: "Done",
            ),
          ],
        ),
      ),
      drawer: NavigationDrawer(),
      body: TabBarView(
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
              return //AddTask();
                  Task(textStyleTitle: widget.textStyleTitle,textStyleDes: widget.textStyleDes,);
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
            itemCount: active.length,
            itemBuilder: (BuildContext context, int index) {
              return Misssing(
                textStyleTitle: widget.textStyleTitle,
                textStyleDes: widget.textStyleDes,
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
