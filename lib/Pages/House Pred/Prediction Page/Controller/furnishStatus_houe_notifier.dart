import 'package:flutter/cupertino.dart';

class furnishStatuts_notifier with ChangeNotifier{

  String _defaultFeature = '';
  String get defaultFeature => _defaultFeature;

  List dropDownListData = [
    {"title": "Not Furnished", "value": "1"},
    {"title": "Semi-Furnished", "value": "2"},
    {"title": "Furnished", "value": "3"}

  ];

  set setFeature(String feature){
    _defaultFeature = feature;
    notifyListeners();

  }
}