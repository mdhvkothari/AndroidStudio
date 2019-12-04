import 'package:flutter/material.dart';
import 'constant.dart';
import 'RusableCard.dart';
import 'button_functionality.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({this.bmiResult,this.resultText,this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculated BMI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Your Result",
                style: titleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: result,
                  ),
                  Text(
                    bmiResult,
                    style: getNumber,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: comment,
                  ),
                ],
              ),
            ),
          ),
          ButtonButton(
            onTap: () {
              Navigator.pop(context);
            },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
