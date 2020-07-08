import 'package:detailbook/model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.pink[900],
      title: 'detailBook',
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Data> list = [];

  @override
  void initState() {
    DatabaseReference dbRef = FirebaseDatabase.instance.reference();
    dbRef.child('order').once().then((DataSnapshot snapshot) {
      var keys = snapshot.value.keys;
      var data = snapshot.value;
      list.clear();
      for (var key in keys) {
        Data d = Data(
          data[key]['name'],
          data[key]['town'],
          data[key]['dateTime'],
          data[key]['pp1'],
          data[key]['pp500'],
          data[key]['pp250'],
          data[key]['pp100'],
          data[key]['pp50'],
          data[key]['tata10'],
          data[key]['tata5'],
          data[key]['jar1'],
          data[key]['jar500'],
          data[key]['jar250'],
          data[key]['e250'],
          data[key]['e20'],
          data[key]['e10'],
          data[key]['e5'],
          data[key]['a250'],
          data[key]['a20'],
          data[key]['a10'],
          data[key]['a5'],
          data[key]['tatasale'],
          data[key]['ishakti'],
        );
        list.add(d);
        print(d.dateTime);
      }
      setState(() {
        print(list);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detailBook'),
        backgroundColor: Colors.pink[900],
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: list.length == 0
            ? Text('No data available')
            : ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  return Card(
                    margin:EdgeInsets.all(5.0),
                    elevation: 5.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Name: " + list[index].name,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Town: " + list[index].town,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Date Time : " + list[index].dateTime,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("PP 1kg: " + list[index].pp500,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("PP 500gm: " + list[index].pp250,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("PP 250gm: " + list[index].pp100,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("PP 100gm: " + list[index].pp100,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("PP 50gm: " + list[index].pp50,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Tata 10rs: " + list[index].tata10,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Tata 5rs: " + list[index].tata5,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Jar 1kg: " + list[index].jar1,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Jar 500gm: " + list[index].jar500,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Jar 250gm: " + list[index].jar250,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Elaichi 500gm: " + list[index].e250,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Elaichi 20rs: " + list[index].e20,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Elaichi 10rs: " + list[index].e10,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Elaichi 5rs: " + list[index].e5,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Agni 250gm: " + list[index].a250,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Agni 20rs: " + list[index].a20,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Agni 10rs: " + list[index].a10,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("Agni 5rs: " + list[index].a5,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("TATA SALT: " + list[index].tatasalt,
                              style: TextStyle(fontSize: 20)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text("I-SHAKTI: " + list[index].ishakti,
                              style: TextStyle(fontSize: 20)),
                        ],
                      ));
                  return Center(child: CircularProgressIndicator());
                },
              ),
      ),
    );
  }
}
