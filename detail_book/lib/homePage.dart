import 'package:detail_book/todayList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'allList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  int _page = 0;

  @override
  void initState() {
    pageController = PageController();
  }

  void onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Book'),
        backgroundColor: Colors.pink[900],
      ),
      body: PageView(
        children: <Widget>[
          Container(
            child: todayList(),
          ),
          Container(
            child: allList(),
          )
        ],
        controller: pageController,
        onPageChanged: onPageChange,
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CupertinoTabBar(
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_view_day,
                  color: (_page == 0)?Colors.pink[900]:Colors.grey,
                ),
                title: Text('Today\'s order',style: TextStyle(
                  fontSize: 15,
                  color: (_page == 0)
                      ? Colors.pink[900]
                      : Colors.grey,
                ),),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.view_quilt,
                  color: (_page == 1)?Colors.pink[900]:Colors.grey,
                ),
                title: Text('All order',style: TextStyle(
                  fontSize: 15,
                  color: (_page == 1)
                      ? Colors.pink[900]
                      : Colors.grey,
                ),),
              )
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
}
