// coin_model.dart

import 'package:flutter/foundation.dart';

class CoinModel with ChangeNotifier {
  bool _hasWonCoin1 = false;

  bool get hasWonCoin1 => _hasWonCoin1;

  void winCoin1() {
    _hasWonCoin1 = true;
    notifyListeners();
  }
}