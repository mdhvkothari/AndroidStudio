//import 'package:flutter/material.dart';
//
//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return
//      Center(
//         child: Container(
//            alignment: Alignment.center,
//            color: Colors.blueAccent,
//            width: 300.0,
//            height: 100.0,
//            margin: EdgeInsets.all(20.0),
//            margin: EdgeInsets.only(top: 50.0),
//           child: Text("Flight",textDirection: TextDirection.ltr,
//              style: TextStyle(
//                decoration: TextDecoration.none,
//                fontSize: 50.0,
//                fontFamily: 'Ubuntu',
//                color: Colors.white,
//
//
//              ),
//           ),
//          )
//      );
//  }
//}
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsets.only(top: 28.0,left: 10.0),
            alignment: Alignment.center,
            color: Colors.blueAccent,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    //When we have big text and we want to put it into the row then we use expanded
                    Expanded(
                      child: Text(
                        "Spice jet",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 40.0,
                          fontFamily: 'Ubuntu',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "From Mumbai to Delhi",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 30.0,
                          fontFamily: 'Ubuntu',
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    //When we have big text and we want to put it into the row then we use expanded
                    Expanded(
                      child: Text(
                        "Jit Air",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 40.0,
                          fontFamily: 'Ubuntu',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "From Delhi to Mumbai",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 30.0,
                          fontFamily: 'Ubuntu',
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                addingImage(),
                myButton(),
              ],
            )));
  }
}

class addingImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    AssetImage assetImage = AssetImage('image/mustang.jpg');
    Image image = Image(image: assetImage,width: 400.0,height: 400.0,);
    return Container(
      padding: EdgeInsets.only(right: 10.0),
      child: image,);
  }
}

class myButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
          color: Colors.deepOrangeAccent,
          child: Text("Book your flight",
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
            ),
          ), 
          elevation: 6.0,
          onPressed: () => bookFlight(context),
          ),
    );
  }
  void bookFlight(BuildContext context){
      var alertDialog = AlertDialog(
        title: Text("Sucessfully Booked"),
      );
      showDialog(context: context,builder: (BuildContext)=> alertDialog);
  }
}


