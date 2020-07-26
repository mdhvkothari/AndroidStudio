import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rate_book/Screens/loading.dart';
import 'package:rate_book/Service/database.dart';
import 'package:rate_book/model/chartModel.dart';

class particularItemScreen extends StatefulWidget {
  String item, city;

  particularItemScreen({this.item, this.city});

  @override
  _particularItemScreenState createState() => _particularItemScreenState();
}

class _particularItemScreenState extends State<particularItemScreen> {
  Stream getData;
  List<charts.Series<Rate, String>> _seriesbarData;
  List<Rate> myData;
  Database database = Database();

  _generate(myData) {
    _seriesbarData.add(charts.Series(
      domainFn: (Rate rates, _) => rates.dateVal,
      measureFn: (Rate rates, _) => int.parse(rates.rateVal),
      id: "Jaipur",
      data: myData,
      labelAccessorFn: (Rate row, _) => "${row.dateVal}",
    ));
  }
  @override
  void initState() {
    database.getData(widget.city, widget.item).then((val) {
      setState(() {
        getData = val;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[900],
        title: Text(
          widget.item,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("Jaipur").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return  Loading();
          } else {
            List<Rate> rates = snapshot.data.documents
                .map((documentSnapshot) => Rate.fromMap(documentSnapshot.data))
                .toList();
            print(rates);
            return _buildChart(context, rates);
          }
        },
      ),
    );
  }

  Widget _buildChart(BuildContext context, List<Rate> rates) {
    myData = rates;
    _generate(myData);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: charts.BarChart(
                  _seriesbarData,
                  animate: true,
                  animationDuration: Duration(seconds: 5),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
