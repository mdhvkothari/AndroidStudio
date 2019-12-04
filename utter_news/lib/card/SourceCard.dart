import 'package:flutter/material.dart';
import 'package:utter_news/model/model.dart';
import 'package:utter_news/ArticleScreen.dart';

class SourceList extends StatelessWidget {
  const SourceList({
    Key key,
    @required this.sources,
  }) : super(key: key);

  final List<Source> sources;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: sources
          .map((source) => GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleScreen(source: source,)));
        },
        child: Card(
          elevation: 5.0,
          color: Colors.white,
          margin: EdgeInsets.symmetric(
              vertical: 8.0, horizontal: 14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin:
                EdgeInsets.symmetric(horizontal: 15.0),
                width: 100.0,
                height: 150.0,
                child: Image.asset('assets/logo.png'),
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
                                top: 20.0, bottom: 10.0),
                            child: Text(
                              '${source.name}',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight:
                                  FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '${source.description}',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Category: ${source.category}',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ))
          .toList(),
    );
  }
}
