import 'package:accounts/Screens/addingSaleBills.dart';
import 'package:accounts/Screens/saleBills.dart';
import 'package:accounts/Screens/taxBills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addingTaxBills.dart';

class shopBillDetails extends StatefulWidget {
  String uid, id, shopName;

  shopBillDetails({this.uid, this.id, this.shopName});

  @override
  _shopBillDetailsState createState() => _shopBillDetailsState();
}

class _shopBillDetailsState extends State<shopBillDetails> {
  PageController pageController;
  int _page = 0;

  @override
  void initState() {
    pageController = PageController();
  }

  void onPageChange(int page) {
    setState(() {
      _page = page;
      print(widget.id);
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shopName),
        backgroundColor: Colors.pink[900],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_page == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => addingSaleBills(
                          uid: widget.uid,
                          id: widget.id,
                        )));
          }
          if (_page == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => addingTaxBills(
                      uid: widget.uid,
                      id: widget.id,
                    )));
          }

        },
        backgroundColor: Colors.pink[900],
        child: Icon(Icons.add),
      ),
      body: PageView(
        children: <Widget>[
          Container(
              child: saleBills(
            uid: widget.uid,
            id: widget.id,
          )),
          Container(
              child: taxBills(
            id: widget.id,
            uid: widget.uid,
          )),
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
                  color: (_page == 0) ? Colors.pink[900] : Colors.grey,
                ),
                title: Text(
                  'SALE',
                  style: TextStyle(
                    fontSize: 15,
                    color: (_page == 0) ? Colors.pink[900] : Colors.grey,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.view_quilt,
                  color: (_page == 1) ? Colors.pink[900] : Colors.grey,
                ),
                title: Text(
                  'TX',
                  style: TextStyle(
                    fontSize: 15,
                    color: (_page == 1) ? Colors.pink[900] : Colors.grey,
                  ),
                ),
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
