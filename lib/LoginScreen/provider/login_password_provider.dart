import 'package:flutter/cupertino.dart';

class LoginPasswordVisibilityProvider with ChangeNotifier {
  bool _visible = true;
  bool get visible => _visible;

  void VisibiltyFunc() {
    _visible = !_visible;
    notifyListeners();
  }
}
