import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/model.dart';
import 'package:url_launcher/url_launcher.dart';

String API_kEY = '24bcccedf20d412aa67dc9693f58d729';

Future<List<Article>> fetchArticleBySource(String source) async {
  final response = await http.get(
      'https://newsapi.org/v2/top-headlines?sources=${source}&apiKey=${API_kEY}');
  if (response.statusCode == 200) {
    List articles = json.decode(response.body)['articles'];
    return articles.map((article) => Article.fromJson(article)).toList();
  } else {
    throw Exception('Falied to load source list');
  }
}

class ArticleScreen extends StatefulWidget {
  final Source source;

  ArticleScreen({this.source});

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  var list_articles;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    refreshListArticle();
  }

  Future<Null> refreshListArticle() async {
    refreshKey.currentState?.show(atTop: false);
    setState(() {
      list_articles = fetchArticleBySource(widget.source.id);
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.source.name),
        ),
        body: Center(
          child: RefreshIndicator(
            key: refreshKey,
            child: FutureBuilder<List<Article>>(
              future: list_articles,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<Article> articles = snapshot.data;
                  return ListView(
                    children: articles
                        .map((article) => GestureDetector(
                              onTap: () {
                                _launchUrl(widget.source.url);
                              },
                              child: Card(
                                elevation: 5.0,
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 4.0),
                                      width: 100.0,
                                      height: 100.0,
                                      child: article.urlToImage != null
                                          ? Image.network(article.urlToImage)
                                          : Image.asset('assets/logo.png'),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 20.0,
                                                      bottom: 10.0,
                                                      left: 8.0),
                                                  child: Text(
                                                    '${article.title}',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              'Published At: ${article.description}',
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color:Colors.grey,
                                                    fontWeight: FontWeight.bold
                                                )
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 8.0,top: 10.0,bottom: 10.0),
                                            child: Text(
                                                'Published At: ${article.publishedAt}',
                                                style: TextStyle(
                                                    fontSize: 12.0,
                                                    color:Colors.black12,
                                                    fontWeight: FontWeight.bold
                                                )
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            onRefresh: refreshListArticle,
          ),
        ),
      );
  }

  _launchUrl(String url)async{
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw('Couldn\'t launch ${url}');
    }
  }
}
