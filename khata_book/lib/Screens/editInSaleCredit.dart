import 'package:flutter/material.dart';
import 'package:khata_book/Services/database.dart';
import 'loading.dart';

class editSaleCredit extends StatefulWidget {
  String shopId, billId, place, id,amount;

  editSaleCredit({this.shopId, this.place, this.billId, this.id,this.amount});

  @override
  _editSaleCreditState createState() => _editSaleCreditState();
}

class _editSaleCreditState extends State<editSaleCredit> {
  final _key = GlobalKey<FormState>();
  String creditAmount, id;
  DateTime _date = DateTime.now();
  bool _isLoading = false;
  Database database = Database();

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2021));
    setState(() {
      _date = picked;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("editCredit"),
        backgroundColor: Colors.pink[900],
      ),
      body: _isLoading
          ? Loading()
          : Form(
              key: _key,
              child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: Column(children: <Widget>[
                    TextFormField(
                      initialValue: widget.amount,
                      validator: (val) => val.isEmpty ? "Enter Amount" : null,
                      decoration: InputDecoration(
                        hintText: "Enter Credit Amount",
                      ),
                      onChanged: (val) {
                        creditAmount = val;
                      },
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                          ),
                          onPressed: () {
                            selectDate(context);
                          },
                          iconSize: 30.0,
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          "$_date" != null
                              ? "${_date.day}-${_date.month}-${_date.year}"
                              : "SELECT DATE",
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ],
                    ),
                    Spacer(),
                    RaisedButton(
                      onPressed: () async {
                        if (_key.currentState.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          Map<String, dynamic> saleBillMap = {
                            "creditAmount": creditAmount,
                            "date": "${_date.day}-${_date.month}-${_date.year}",
                            "id": id
                          };
                          if (widget.place == "Jewar") {
                            if(creditAmount==null){
                              creditAmount = widget.amount;
                            }
                            await database
                                .editJewarCreditSaleMoney(
                                    widget.shopId,
                                    widget.billId,
                                    widget.id,
                                    creditAmount,
                                    "${_date.day}-${_date.month}-${_date.year}")
                                .then((val) {
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pop(context);
                            });
                          }
                          if (widget.place == "Tappal") {
                            if(creditAmount==null){
                              creditAmount = widget.amount;
                            }
                            await database
                                .editTappalCreditSaleMoney(
                                    widget.shopId,
                                    widget.billId,
                                    widget.id,
                                    creditAmount,
                                    "${_date.day}-${_date.month}-${_date.year}")
                                .then((val) {
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pop(context);
                            });
                          }
                          if (widget.place == "Local") {
                            if(creditAmount==null){
                              creditAmount = widget.amount;
                            }
                            await database
                                .editLocalCreditSaleMoney(
                                    widget.shopId,
                                    widget.billId,
                                    widget.id,
                                    creditAmount,
                                    "${_date.day}-${_date.month}-${_date.year}")
                                .then((val) {
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pop(context);
                            });
                          }
                          if (widget.place == "Jhangirpur") {
                            if(creditAmount==null){
                              creditAmount = widget.amount;
                            }
                            await database
                                .editJhangirpurCreditSaleMoney(
                                    widget.shopId,
                                    widget.billId,
                                    widget.id,
                                    creditAmount,
                                    "${_date.day}-${_date.month}-${_date.year}")
                                .then((val) {
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pop(context);
                            });
                          }
                        }
                      },
                      child: Text("Add"),
                    )
                  ])),
            ),
    );
  }
}
