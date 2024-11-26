import 'package:flutter/cupertino.dart';

class FareTextNotifier with ChangeNotifier{

  TextEditingController _fareController = TextEditingController();
  TextEditingController get fareController => _fareController;

  var fareFormKey = GlobalKey<FormState>();



}