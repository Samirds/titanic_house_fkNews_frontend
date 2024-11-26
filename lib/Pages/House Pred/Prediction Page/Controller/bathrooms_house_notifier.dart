import 'package:flutter/cupertino.dart';

class BathroomsHouseNotifier with ChangeNotifier{

  String _defaultFeature = '';
  String get defaultFeature => _defaultFeature;

  List dropDownListData = [
    {"title": "Single", "value": "1"},
    {"title": "Multiple", "value": "2"},
  ];

  set setFeature(String feature){
    _defaultFeature = feature;
    notifyListeners();

  }
}