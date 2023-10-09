import 'package:flutter/foundation.dart';

class CoinModel extends ChangeNotifier {
  bool _hasWonCoin1 = false;
  bool _showCoin1Notification = false;

  bool get hasWonCoin1 => _hasWonCoin1;
  bool get showCoin1Notification => _showCoin1Notification;

  void markCoin1AsWon() {
    _hasWonCoin1 = true;
    _showCoin1Notification = true;
    notifyListeners();
  }

  void hideCoin1Notification() {
    _showCoin1Notification = false;
    notifyListeners();
  }
}