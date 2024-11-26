import 'package:flutter/cupertino.dart';

class CabinDrpDnNotifier with ChangeNotifier{

  String _defaultFeature = '';
  String get defaultFeature => _defaultFeature;

  List dropDownListData = [
    {"title": "S", "value": "S"},
    {"title": "C", "value": "C"},
    {"title": "Q", "value": "Q"},
    {"title": "B", "value": "B"},
    {"title": "Other", "value": "Other"},

  ];

  set setFeature(String feature){
    _defaultFeature = feature;
    notifyListeners();

  }
}