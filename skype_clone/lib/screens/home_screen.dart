import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skype_clone/screens/page_view/chat_list_screen.dart';
import 'package:skype_clone/utils/universal_variables.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController;
  int _page = 0;

  @override
  void initState(){
    super.initState();
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
      backgroundColor: Colors.black ,
      body: PageView(
        children: <Widget>[
          Container(
            child:ChatListScreen() ,
          ),
          Center(
            child: Text("Call Logs",style: TextStyle(color: Colors.white),),
          ),
          Center(
            child: Text("Contact Screen",style: TextStyle(color: Colors.white),),
          ),
        ],
        controller: pageController,
        onPageChanged: onPageChange,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: CupertinoTabBar(
            backgroundColor: Colors.black,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  color: (_page == 0)
                      ? Universalvariables.liteBlueColor
                      : Universalvariables.greyColor,
                ),
                title: Text(
                  "Chats",
                  style: TextStyle(
                    fontSize: 10,
                    color: (_page == 0)
                        ? Universalvariables.liteBlueColor
                        : Universalvariables.greyColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.call,
                  color: (_page == 1)
                      ? Universalvariables.liteBlueColor
                      : Universalvariables.greyColor,
                ),
                title: Text(
                  "Chats",
                  style: TextStyle(
                    fontSize: 10,
                    color: (_page == 1)
                        ? Universalvariables.liteBlueColor
                        : Universalvariables.greyColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.contact_phone,
                  color: (_page == 2)
                      ? Universalvariables.liteBlueColor
                      : Universalvariables.greyColor,
                ),
                title: Text(
                  "Chats",
                  style: TextStyle(
                    fontSize: 10,
                    color: (_page == 2)
                        ? Universalvariables.liteBlueColor
                        : Universalvariables.greyColor,
                  ),
                ),
              ),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ),
      ),
    );
  }
}
