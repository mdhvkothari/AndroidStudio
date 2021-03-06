import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'jhangirpurSale.dart';
import 'jhangirpurTax.dart';

class JhangirpurBills extends StatefulWidget {
  String id, shopName, place;

  JhangirpurBills({this.id, this.shopName, this.place});

  @override
  _JhangirpurBillsState createState() => _JhangirpurBillsState();
}

class _JhangirpurBillsState extends State<JhangirpurBills> {
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
        title: Text(widget.shopName),
        backgroundColor: Colors.pink[900],
      ),
      body: PageView(
        children: <Widget>[
          Container(
            child: jhangipurSale(
              shopId: widget.id,
              place: widget.place,
            ),
          ),
          Container(
            child: jhangipurTax(
              shopId: widget.id,
              place: widget.place,
            ),
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
