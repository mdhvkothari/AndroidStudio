import 'package:flutter/material.dart';
import 'constant.dart';

class ButtonButton extends StatelessWidget {
  ButtonButton({this.onTap,this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
              buttonTitle,
              style: buttonStyle,
            )),
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 55.0,
      ),
    );
  }
}
