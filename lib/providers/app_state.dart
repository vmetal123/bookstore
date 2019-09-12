import 'package:flutter/foundation.dart';

class AppState with ChangeNotifier {
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void expandPopular() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
}