import 'package:flutter/cupertino.dart';

class GenderRdNotifier with ChangeNotifier{
  String _gender = 'Male';
  String get selectGender => _gender;

  set setGender(String gndr){
    _gender = gndr;
    notifyListeners();

  }
}