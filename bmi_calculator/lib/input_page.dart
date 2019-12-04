import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconWidget.dart';
import 'RusableCard.dart';
import 'constant.dart';
import 'button_functionality.dart';
import 'icon_button.dart';
import 'calculation.dart';
import 'results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int height = 180;
int weight = 60;
int age = 20;



class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveColor;
  Color femaleCardColour = inactiveColor;

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.male
                        ? activeColor
                        : inactiveColor,
                    cardChild: contentWidget(
                        icon: FontAwesomeIcons.mars, lable: 'MALE'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    colour: selectedGender == Gender.female
                        ? activeColor
                        : inactiveColor,
                    cardChild: contentWidget(
                      icon: FontAwesomeIcons.venus,
                      lable: 'FEMALE',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              child: ReusableCard(
                colour: activeColor,
                cardChild: Column(
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: labelTextStyle,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: textOfHeight,
                          ),
                          Text(
                            'cm',
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 5.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 15.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 500.0,
              width: 370.0,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: activeColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: labelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: textOfHeight,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIcon(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIcon(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    colour: activeColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: textOfHeight,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIcon(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIcon(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
          ButtonButton(
            buttonTitle: 'CALCULATE',
            onTap: (){
              Calculation cal = Calculation(weight: weight,height: height);
              Navigator.push(context,MaterialPageRoute(builder: (context){
                return ResultsPage(
                  bmiResult: cal.calculationBmi(),
                  resultText: cal.getResult(),
                  interpretation: cal.interpration(),
                );
              }));
            },
          )
        ],
      ),
    );
  }
}


