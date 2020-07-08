import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eLearning',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FoldableSidebarBuilder(
        drawerBackgroundColor: Colors.blue,
        drawer: CustomDrawer(),
        screenContents: Home(),
        status: drawerStatus,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            // To Open/Close Sidebar
            setState(() {
              drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                  ? FSBStatus.FSB_CLOSE
                  : FSBStatus.FSB_OPEN;
            });
          }),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Text("Welcome to sharda Elearning portal"),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {

  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width:100,
                    height: 100,
                    decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("User Email Id",style: TextStyle(color: Colors.white,fontSize: 25),)
                ],
              )),
          ListTile(
            onTap: (){
              debugPrint("Tapped Profile");
            },
            leading: Icon(Icons.dashboard),
            title: Text(
              "Dashboard",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Payments");
            },
            leading: Icon(Icons.book),
            title: Text("Material"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Notifications");
            },
            leading: Icon(Icons.person_outline),
            title: Text("About Us"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Log Out");
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}