import 'package:flutter/cupertino.dart';

class BedroomsHouseNotifier with ChangeNotifier{

  String _defaultFeature = '';
  String get defaultFeature => _defaultFeature;

  List dropDownListData = [
    {"title": "Economy", "value": "1"},
    {"title": "Luxury", "value": "2"},
  ];

  set setFeature(String feature){
    _defaultFeature = feature;
    notifyListeners();

  }
}