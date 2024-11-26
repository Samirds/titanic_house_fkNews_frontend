import 'package:flutter/cupertino.dart';

class PclassDrpDnNotifier with ChangeNotifier{

  String _defaultFeature = '';
  String get defaultFeature => _defaultFeature;

  List dropDownListData = [
    {"title": "1", "value": "1"},
    {"title": "2", "value": "2"},
    {"title": "3", "value": "3"}

  ];

  set setFeature(String feature){
    _defaultFeature = feature;
    notifyListeners();

  }
}