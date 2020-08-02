import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'jewarSale.dart';
import 'jewarTax.dart';

class jewarBills extends StatefulWidget {
  String id, shopName, palce;

  jewarBills({this.id, this.shopName, this.palce});

  @override
  _jewarBillsState createState() => _jewarBillsState();
}

class _jewarBillsState extends State<jewarBills> {
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

      body: PageView(
        children: <Widget>[
          Container(
            child: jewarSale(
              shopId: widget.id,
              place: widget.palce,
            ),
          ),
          Container(
            child: jewarTax(
              shopId: widget.id,
              place: widget.palce,
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
