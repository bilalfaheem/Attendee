import 'package:flutter/cupertino.dart';

class SignupPasswordVisibilityProvider with ChangeNotifier {
  bool _visible = true;
  bool get visible => _visible;

  void VisibiltyFunc() {
    _visible = !_visible;
    notifyListeners();
  }
}
