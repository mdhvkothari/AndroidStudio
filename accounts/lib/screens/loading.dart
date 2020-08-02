import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  Color dotColor;
  Loading({this.dotColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      child: Center(
        child: SpinKitChasingDots(
          color: dotColor,
          size: 50.0,
        ),
      ),
    );
  }
}