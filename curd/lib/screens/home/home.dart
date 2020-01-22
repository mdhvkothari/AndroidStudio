import 'package:curd/model/saleModel.dart';
import 'package:curd/screens/home/saleList.dart';
import 'package:curd/services/auth.dart';
import 'package:curd/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<SaleData>>.value(
      value: DatabaseService().sale,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Your Account"),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.exit_to_app),
              label: Text("Logout"),
              onPressed: ()async {
                await _authService.signOut();
              },
            )
          ],
        ),
        body: SaleList(),
      ),
    );
  }
}
