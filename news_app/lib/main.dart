import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about.dart';
import 'models/model.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

String API_KEY = '24bcccedf20d412aa67dc9693f58d729';

Future<List<Article>> fetchArticle() async {
  final response = await http
      .get("https://newsapi.org/v2/top-headlines?country=in&apiKey=$API_KEY");
  if (response.statusCode == 200) {

    List articles = json.decode(response.body)['articles'];
    print(articles);
    return articles.map((article) => Article.fromJson(article)).toList();

  } else {
    throw Exception('Failed to load article list');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var articleList;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    refreshArticle();
  }

  Future<Null> refreshArticle() {
    refreshKey.currentState?.show(atTop: false);
    setState(() {
      articleList = fetchArticle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          title: Text(
            'uTTerNews',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(28, 51, 52, 1.0)),
      body: SafeArea(
        child: Center(
          child: RefreshIndicator(
              key: refreshKey,
              onRefresh: refreshArticle,
              child: FutureBuilder<List<Article>>(
                  future: articleList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Error ${snapshot.error}',
                            style: TextStyle(color: Colors.red, fontSize: 20.0),
                          ),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      List<Article> articles = snapshot.data;
                      return ListView(
                        children: articles
                            .map((article) => GestureDetector(
                                  onTap: () {
                                    _launchUrl(article.url);
                                  },
                                  child: Card(
                                    elevation: 5.0,
                                    color: Colors.white,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 250,
                                          child: article.urlToImage != null
                                              ? Image.network(
                                                  article.urlToImage)
                                              : Image.asset('images/Capture.PNG'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20.0,
                                              bottom: 10.0,
                                              left: 8.0),
                                          child: Text(
                                            '${article.title}',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                              'Published At: ${article.description}',
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 8.0,
                                              top: 10.0,
                                              bottom: 10.0),
                                          child: Text(
                                              'Published At: ${article.publishedAt}',
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.black12,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 8.0,
                                              top: 10.0,
                                              bottom: 10.0),
                                          child: Text('Tap to know More!!',
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.black12,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    }
                    return CircularProgressIndicator();
                  })),
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => About()));
        },
        child: Icon(Icons.info),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    ));
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw ('Couldn\'t launch ${url}');
    }
  }
}
