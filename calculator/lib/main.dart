import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Interest Calculator",
      home: SIForm(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      ),
    ),
  );
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  //this form key is used to store the key of form in future if we use
  var _formkey = GlobalKey<FormState>();
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];
  final _minimunPadding = 5.0;
  var _currentvalueselected = 'Rupees';

  //for extracting value from the text field
  TextEditingController principleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  String displayResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //for remove zigzak error
//      instead of this we use listview for remove overflow
//      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          "Simple Interest Calculator",
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      //here we use form widged instead of container because when user click on calculate it will
      //show an exception but form does not use margin so we use padding and it have a child padding
      body: Form(
        key: _formkey,
        child: Padding(
            padding: EdgeInsets.all(_minimunPadding*2),

//        margin: EdgeInsets.all(_minimunPadding * 2),
            //remove column with list view for overflow
            child: ListView(
        children: <Widget>[
        //for image
        getImageAsset(),
        //text field
        Padding(
          padding: EdgeInsets.only(
              top: _minimunPadding, bottom: _minimunPadding),
          //we use TextFormField instead of TextField because of validation
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: principleController,
            validator:(String value){
              if(value.isEmpty){
                return "Please enter principle amount";
              }
            },
            decoration: InputDecoration(
              labelText: "Principle",
              hintText: "Enter Principle e.g 12000",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
              top: _minimunPadding, bottom: _minimunPadding),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: rateController,
            validator: (String value){
              if(value.isEmpty){
                return "Please enter Rate";
              }
            },
            decoration: InputDecoration(
              labelText: "Rate of Intrest",
              hintText: "In Percent",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                top: _minimunPadding, bottom: _minimunPadding),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: _minimunPadding, bottom: _minimunPadding),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: timeController,
                        validator: (String value){
                          if(value.isEmpty){
                            return "Please enter Time";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Term",
                          hintText: "Time in Year",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    )),
                //for width between two elements of the row
                Container(
                  width: _minimunPadding * 5,
                ),
                Expanded(
                    child: DropdownButton<String>(
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentvalueselected,
                      onChanged: (String newValueSelected) {
                        _onDropDownItemSelected(newValueSelected);
                      },
                    )),
              ],
            )),
        Padding(
            padding: EdgeInsets.only(
                top: _minimunPadding, bottom: _minimunPadding),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Theme
                        .of(context)
                        .accentColor,
                    child: Text(
                      'Calculate', textScaleFactor: 1.25,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if(_formkey.currentState.validate()){
                          this.displayResult = _calculateTotalReturns();
                        }

                      });
                    },
                  ),
                ),
                Container(
                  width: _minimunPadding * 5,
                ),
                Expanded(
                  child: RaisedButton(
                    color: Theme
                        .of(context)
                        .primaryColorDark,
                    child: Text(
                      //textScaleFactor is used for size
                      'Reset', textScaleFactor: 1.25,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w700,

                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _reset();
                      });
                    },
                  ),
                ),
              ],
            )),
        Padding(
          padding: EdgeInsets.all(_minimunPadding * 2),
          child: Text(
            this.displayResult, textScaleFactor: 1.25,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
            ),
          ),
        )
        ],
      ),
    ),)
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('image/r.png');
    Image image = Image(
      image: assetImage,
      width: 200.0,
      height: 200.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimunPadding * 3),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentvalueselected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    //here .text will extract value form text field is in text so we have to parse it into double
    double principle = double.parse(principleController.text);
    double rate = double.parse(rateController.text);
    double time = double.parse(timeController.text);

    double totalAmountPayable = principle + (principle * rate * time) / 100;

    String result = 'After $time years investment will become $totalAmountPayable $_currentvalueselected ';
    return result;
  }

  void _reset() {
    principleController.text = '';
    rateController.text = '';
    timeController.text = '';
    displayResult = '';
  }
}
