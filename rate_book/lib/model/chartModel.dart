class Rate {
  final String dateVal;
  final String rateVal;
  final String itemVal;

  Rate(this.rateVal, this.dateVal,this.itemVal);

  Rate.fromMap(Map<String, dynamic> map)
      : assert(map['date'] != null),
        assert(map['rate'] != null),
        assert(map['item'] != null),
        rateVal = map['rate'],
        dateVal = map['date'],
        itemVal = map['item'];

  @override
  String toString() => "Record<$dateVal:$rateVal>";
}
