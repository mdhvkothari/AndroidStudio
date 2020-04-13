import 'dart:async';

import 'package:flutter/material.dart';

class cardData extends StatelessWidget {
  const cardData({
    Key key,
    @required this.detailData, this.timer
  }) : super(key: key);

  final List detailData;
  final Timer  timer;

  @override
  Widget build(BuildContext context) {
    timer.cancel();
    return SafeArea(
      child:  ListView.builder(
        itemCount: detailData != null ? detailData.length - 2 : 0,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.all(5.0),
            elevation: 10.0,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  detailData[index + 2]['Country'],
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'NotoS  ansTC-Regular',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Total Cases : ' +
                              detailData[index + 2]['TotalConfirmed']
                                  .toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[600],
                            fontFamily: 'NotoSansTC-Regular',
                          ),
                        ),
                        Text(
                          'Total Deaths : ' +
                              detailData[index + 2]['TotalDeaths']
                                  .toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.red,
                            fontFamily: 'NotoSansTC-Regular',
                          ),
                        ),
                        Text(
                          'Total Recovered : ' +
                              detailData[index + 2]['TotalRecovered']
                                  .toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.green,
                            fontFamily: 'NotoSansTC-Regular',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'New Cases : ' +
                              detailData[index + 2]['NewConfirmed']
                                  .toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[600],
                            fontFamily: 'NotoSansTC-Regular',
                          ),
                        ),
                        Text(
                          'New Deaths : ' +
                              detailData[index + 2]['NewDeaths']
                                  .toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.red,
                            fontFamily: 'NotoSansTC-Regular',
                          ),
                        ),
                        Text(
                          'New Recovered : ' +
                              detailData[index + 2]['NewRecovered']
                                  .toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.green,
                            fontFamily: 'NotoSansTC-Regular',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
