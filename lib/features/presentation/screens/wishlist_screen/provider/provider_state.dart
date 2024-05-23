import 'package:flutter/foundation.dart';
import 'package:food_saver/features/presentation/screens/wishlist_screen.dart';

class MyState extends ChangeNotifier {
  rebuildscreen() {
    return wishlistScreen();
  }

  void updateWishlistStatus() {
    rebuildscreen();
    notifyListeners();
  }
}
