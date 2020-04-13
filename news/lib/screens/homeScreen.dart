import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/userProfile.dart';
import 'package:news/user.dart';

class HomeScreen extends StatefulWidget {
  final User userDetail;
  HomeScreen({this.userDetail});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  PageController pageController;
  int _page = 0;

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }

  @override
  void initState() {
    pageController = PageController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: Text('uTTerNews'),
      ),
      body: PageView(
        children: <Widget>[
          Center(
            child: Text('home'),
          ),
          Container(
            child: Profile(),
          )
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CupertinoTabBar(items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.format_align_left,
                    color: (_page == 0) ? Colors.blueAccent : Colors.grey),
                title: Text(
                  'News Feed',
                  style: TextStyle(
                      fontSize: 15,
                      color: (_page == 0) ? Colors.blueAccent : Colors.grey),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.person,
                    color: (_page == 1) ? Colors.blueAccent : Colors.grey),
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 15,
                      color: (_page == 1) ? Colors.blueAccent : Colors.grey),
                ))
          ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
}
