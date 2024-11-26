import 'package:flutter/cupertino.dart';

class ParchTextNotifier with ChangeNotifier{

  TextEditingController _parchController = TextEditingController();
  TextEditingController get parchController => _parchController;

  var parchFormKey = GlobalKey<FormState>();

}