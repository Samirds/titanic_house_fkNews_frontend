import 'package:flutter/cupertino.dart';

class AgeTextNotifier with ChangeNotifier{

  TextEditingController _ageController = TextEditingController();
  TextEditingController get ageController => _ageController;

  var ageFormKey = GlobalKey<FormState>();





}