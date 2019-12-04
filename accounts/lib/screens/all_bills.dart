import 'package:flutter/material.dart';
import './adding_bills.dart';

class BillDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BillDetailState();
  }
}

class BillDetailState extends State<BillDetail> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddBills"),
      ),
      body: getAllBills(),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          debugPrint("add");
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddingBillDetail();
          }));
        },
        tooltip: 'AddBills',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getAllBills() {
    TextStyle titleStyle = Theme
        .of(context)
        .textTheme
        .subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder:(BuildContext context, int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading:CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.attach_money),
            ),
            title: Text("Dummy bill number",style: titleStyle,),
            subtitle: Text("Dummy Date and bills description"),
            trailing: Icon(Icons.add,color: Colors.grey,),

            onTap: (){
              debugPrint("Bills detail ");
            },
          ),
        );
      },
    );
  }
}
