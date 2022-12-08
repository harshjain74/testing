import 'package:flutter/cupertino.dart';

class Prov extends ChangeNotifier {
  String _gmail = "Test@gmail.com";

  String get gmail => _gmail;

  void setgmail(String value) {
    _gmail = value;
    notifyListeners();
  }
}
