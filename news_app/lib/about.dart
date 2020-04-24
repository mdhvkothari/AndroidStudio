import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(28, 51, 52, 1.0),
          title: Text('AboutUs'),
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "uTTerNews provides you the aggregate of the latest news and reports from trusted sources across India. In this app, we have tried to show the working of an online news system which retrieves all top news form from different channels of India. \nThis app saves your time from looking up at individual sources to get your daily intake of news and reports.",
                  style: TextStyle(
                    fontSize: 21.0,
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(28, 51, 52, 1.0),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Check our website:',
                    style: TextStyle(
                      fontSize: 21.0,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(28, 51, 52, 1.0),
                    )),
                RaisedButton(
                  child: Text(
                    'click Me!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _launchUrl();
                  },
                  color: Color.fromRGBO(28, 51, 52, 1.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  elevation: 10.0,
                  splashColor: Colors.white,
                ),
                SizedBox(
                  height: 50.0,
                ),
                DelayedDisplay(
                  delay: Duration(seconds: 1),
                  child: Text('Stay Updated!!',
                      style: TextStyle(
                        fontSize: 21.0,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(28, 51, 52, 1.0),
                      )),
                ),
                DelayedDisplay(
                  delay: Duration(seconds: 2),
                  child: Text('Do rate us!!',
                      style: TextStyle(
                        fontSize: 21.0,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(28, 51, 52, 1.0),
                      )),
                ),
                DelayedDisplay(
                  delay: Duration(seconds: 3),
                  child: Text('Share ur idea with us!!',
                      style: TextStyle(
                        fontSize: 21.0,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(28, 51, 52, 1.0),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(28, 51, 52, 1.0),
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 50.0,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(28, 51, 52, 1.0),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyApp()));
        },
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  _launchUrl() async {
    if (await canLaunch("https://utternews.herokuapp.com/")) {
      await launch("https://utternews.herokuapp.com/");
    } else {
      throw ('Couldn\'t launch https://utternews.herokuapp.com/}');
    }
  }
}
