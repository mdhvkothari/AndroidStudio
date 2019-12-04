import 'package:flutter/material.dart';
import 'model/model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'card/SourceCard.dart';

String API_kEY = '24bcccedf20d412aa67dc9693f58d729';

Future<List<Source>> fetchNewSources() async {
  final response = await http.get(
      'https://newsapi.org/v2/sources?&country=in&apiKey=${API_kEY}');
  if (response.statusCode == 200) {
    List sources = json.decode(response.body)['sources'];
    return sources.map((source) => Source.fromJson(source)).toList();
  }
  else{
    throw Exception('Falied to load source list');
  }
}


class SourceScreen extends StatefulWidget {
  @override
  _SourceScreenState createState() => _SourceScreenState();
}

class _SourceScreenState extends State<SourceScreen> {
  var list_sources;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    refreshListSource();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'uTTerNews',
      theme: ThemeData(primaryColor: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: Text('uTTerNews'),
        ),
        body: Center(
          child: RefreshIndicator(
            key: refreshKey,
            child: FutureBuilder<List<Source>>(
              future: list_sources,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<Source> sources = snapshot.data;
                  return SourceList(sources: sources);
                }
                return CircularProgressIndicator();
              },
            ),
            onRefresh: refreshListSource,
          ),
        ),
      ),
    );
  }

  Future<Null> refreshListSource() async {
    refreshKey.currentState?.show(atTop: false);
    setState(() {
      list_sources = fetchNewSources();
    });
    return null;
  }
}

