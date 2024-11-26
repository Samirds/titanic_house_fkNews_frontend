import 'package:flutter/cupertino.dart';

class EmbarkedDrpDnNotifier with ChangeNotifier{

  String _defaultFeature = '';
  String get defaultFeature => _defaultFeature;

  List dropDownListData = [
    {"title": "S", "value": "S"},
    {"title": "C", "value": "C"},
    {"title": "Q", "value": "Q"},

  ];

  set setFeature(String feature){
    _defaultFeature = feature;
    notifyListeners();

  }
}