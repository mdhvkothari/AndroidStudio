
class Account{
  int _id;
  String _shopName;
  String _areaOfShop;
  String _billNumber;
  int _billAmount;
  String _date;
  String _billAbout;

  Account(this._shopName,this._billAbout,this._areaOfShop,this._billAmount,this._billNumber,this._date);

  Account.withId(this._id);

  int get id => _id;

  String get shopName => _shopName;

  String get areaOfShop => _areaOfShop;

  int get billAmount => _billAmount;

  String get billNumber => _billNumber;

  String get date => _date;

  String get billAbout => _billAbout;

  set shopName(String shopName){
    this._shopName = shopName;
  }
  set areaOfShop(String areaOfShop){
    this._areaOfShop = areaOfShop;
  }
  set billAmount(int billAmount){
    this._billAmount = billAmount;
  }
  set billNumber(String billNumber){
    this._billNumber = billNumber;
  }
  set date(String date){
    this._date = date;
  }
  set billAbout(String billAbout){
    this._billAbout = billAbout;
  }

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    if(id != null){
      map['id'] = _id;
    }


    map['shopName'] = _shopName;
    map['areaOfShop'] = _areaOfShop;
    map['billAmout'] = _billAmount;
    map['billNumber'] = _billNumber;
    map['date'] = _date;
    map['billAbout']=_billAbout;
    return map;

  }

  Account.fromMapObject(Map<String,dynamic>map){
    this._id = map['id'];
    this._shopName = map['shopName'];
    this._areaOfShop = map['areaOfShop'];
    this._billAmount = map['billAmount'];
    this._billNumber = map['billNumber'];
    this._date = map['date'];
    this._billAbout = map['billAbout'];
  }

}