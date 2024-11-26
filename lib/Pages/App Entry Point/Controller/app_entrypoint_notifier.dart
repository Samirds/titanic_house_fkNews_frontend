import 'package:flutter/cupertino.dart';

class AppEntpNotifier with ChangeNotifier{
  int _selectpage = 0;
  int get selectPage => _selectpage;

  set setSelectPage(int page){
    _selectpage = page;
    notifyListeners();

  }
}