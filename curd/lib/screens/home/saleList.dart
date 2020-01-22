import 'package:curd/model/saleModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SaleList extends StatefulWidget {
  @override
  _SaleListState createState() => _SaleListState();
}

class _SaleListState extends State<SaleList> {
  @override
  Widget build(BuildContext context) {

    final saleData = Provider.of<List<SaleData>>(context);
    print(saleData);

    return Container();
  }
}
