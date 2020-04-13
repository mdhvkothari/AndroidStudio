import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Solution extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19'),
        backgroundColor: Colors.pink[900],
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  'Corona Virus',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontFamily: 'NotoSansTC-Regular',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  width: 190.0,
                  height: 190.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/corona.jpg'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Text(
                    '''Coronavirus disease (COVID-19) is an infectious disease caused by a new virus.The disease causes respiratory illness (like the flu) with symptoms such as a cough, fever, and in more severe cases, difficulty breathing. You can protect yourself by washing your hands frequently, avoiding touching your face, and avoiding close contact (1 meter or 3 feet) with people who are unwell. Coronavirus disease spreads primarily through contact with an infected person when they cough or sneeze. It also spreads when a person touches a surface or object that has the virus on it, then touches their eyes, nose, or mouth. ''',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'NotoSansTC-Regular',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Symptoms :',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'NotoSansTC-Regular',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '1. Cough.',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'NotoSansTC-Regular',
                            ),
                          ),
                          Text('2. Fever.',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'NotoSansTC-Regular',
                              )),
                          Text('3. Tiredness.',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'NotoSansTC-Regular',
                              )),
                          Text('4. Difficulty breathing (severe cases).',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'NotoSansTC-Regular',
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '''Do's''',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'NotoSansTC-Regular',
                                fontWeight: FontWeight.w600,
                                color: Colors.green),
                          ),
                        ],
                      ),
                      Text(
                        'Wash your hand frequently.',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'NotoSansTC-Regular',
                        ),
                      ),
                      Text(
                        'Hand sanitizer.',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'NotoSansTC-Regular',
                        ),
                      ),
                      Text(
                        'Wash hands thoroughly after use.',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'NotoSansTC-Regular',
                        ),
                      ),
                      Text('Go to doctor if you feel difficult to breath.',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'NotoSansTC-Regular',
                          )),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.block,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '''Don't''',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'NotoSansTC-Regular',
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                        ),
                      ],
                    ),
                    Text(
                      'Do not panic!',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'NotoSansTC-Regular',
                      ),
                    ),
                    Text(
                      'Do not touch your face.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'NotoSansTC-Regular',
                      ),
                    ),
                    Text(
                      'Do not travel unless necessary.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'NotoSansTC-Regular',
                      ),
                    ),
                    Text(
                      'Do not go to crowded places.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'NotoSansTC-Regular',
                      ),
                    ),
                    Text(
                      'Do not take antibiotics.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'NotoSansTC-Regular',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.phone),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'HelpLine Number: +91 9013151515',
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.tag_faces,
                      color: Colors.pink[900],
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Stay Safe',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.pink[900],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
