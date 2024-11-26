import 'package:flutter/cupertino.dart';

class SibSpTextNotifier with ChangeNotifier{

  TextEditingController _sibspController = TextEditingController();
  TextEditingController get sibspController => _sibspController;

  var sibspFormKey = GlobalKey<FormState>();

}