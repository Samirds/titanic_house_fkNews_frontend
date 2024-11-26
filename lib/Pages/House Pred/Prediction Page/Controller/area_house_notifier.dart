import 'package:flutter/cupertino.dart';

class AreaHouseNotifier with ChangeNotifier{

  TextEditingController _areaController = TextEditingController();
  TextEditingController get areaController => _areaController;

  var areaFormKey = GlobalKey<FormState>();   // we use form key to identify the form by using it





}