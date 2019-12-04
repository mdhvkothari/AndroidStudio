import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/mdhv.jpg'),
                ),
                Text(
                  'Madhav Kothari',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.white,
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.white,
                  ),

                ),
                Card(
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.teal,
                          size: 30.0,
                        ),
                        title: Text(
                          '+91 9675770844',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      )),
                ),
                Card(
                  margin: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 25.0),
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.teal,
                          size: 30.0,
                        ),
                        title: Text(
                          'mdhvkothari007@gmail.com',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        )
                        ,
                      )
                  ),
                )
              ],
            )),
      ),
    );
  }
}
