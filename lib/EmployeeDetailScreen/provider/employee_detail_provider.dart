import 'package:flutter/cupertino.dart';

class EmployeeDetailProvider with ChangeNotifier {
  bool _visible = false;
  bool get visible => _visible;

  void visibiltyFunc() {
    _visible = !_visible;
    notifyListeners();
  }
}
