import 'package:flutter/cupertino.dart';

class YNRadioNotifier with ChangeNotifier{
  String _defaultMR = '1';
  String get defaultMR => _defaultMR;

  String _defaultMS = '1';
  String get defaultMS => _defaultMS;

  String _defaultGR = '1';
  String get defaultGR => _defaultGR;

  String _defaultBM = '1';
  String get defaultBM => _defaultBM;

  String _defaultLX = '1';
  String get defaultLX => _defaultLX;

  String _defaultPK = '1';
  String get defaultPK => _defaultPK;

  String _defaultPF = '1';
  String get defaultPF => _defaultPF;



  set setYesNoValueMainRoad(String yn){
    _defaultMR = yn;
    notifyListeners();
  }

  set setYesNoValueMltstory(String yn){
    _defaultMS = yn;
    notifyListeners();
  }

  set setYesNoValueGstRooms(String yn){
    _defaultGR = yn;
    notifyListeners();
  }

  set setYesNoValueBasement(String yn){
    _defaultBM = yn;
    notifyListeners();
  }

  set setYesNoValueLuxury(String yn){
    _defaultLX = yn;
    notifyListeners();
  }

  set setYesNoValuePark(String yn){
    _defaultPK = yn;
    notifyListeners();
  }

  set setYesNoValuePfarea(String yn){
    _defaultPF = yn;
    notifyListeners();
  }
}