import 'package:finalApp/util/data.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import '../chat/chat_item.dart';
import 'package:flutter/material.dart';

import '../navigation_drawer.dart';

class Chats extends StatefulWidget {
    TextStyle textStyleTitle, textStyleDes, textStyleSearch;
  Chats(
      {@required this.textStyleTitle,
      @required this.textStyleDes,
      @required this.textStyleSearch});
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats>
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
        title: TextField(
          decoration: InputDecoration.collapsed(
            hintText:  translator.translate('search'),
            hintStyle: widget.textStyleSearch
          ),
        ),
       elevation: 4,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).accentColor,
          labelColor: Theme.of(context).accentColor,
          unselectedLabelColor: Theme.of(context).textTheme.caption.color,
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              text:  translator.translate("message"),
            ),
            Tab(
              text:  translator.translate("active"),
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
              Map chat = chats[index];
              return ChatItem(
                dp: chat['dp'],
                name: chat['name'],
                isOnline: chat['isOnline'],
                counter: chat['counter'],
                msg: chat['msg'],
                time: chat['time'],
                textStyleTitle: widget.textStyleTitle,
            textStyleDes: widget.textStyleDes,
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
            itemCount: active.length,
            itemBuilder: (BuildContext context, int index) {
              Map activee = active[index];
              return ChatItem(
                dp: activee['dp'],
                name: activee['name'],
                isOnline: activee['isOnline'],
                counter: activee['counter'],
                msg: activee['msg'],
                time: activee['time'],
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