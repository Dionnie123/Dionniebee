import 'package:firebase_storage/firebase_storage.dart';
import 'package:stacked/stacked.dart';

class ProductWidgetModel extends BaseViewModel {
  bool addedToCartOverlayVisible = false;
  bool addedToFavoritesOverlayVisible = false;
  bool isFavorite = false;

  String? img;

  toggleAddedToCartOverlay() async {
    addedToCartOverlayVisible = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 1000), () {
      addedToCartOverlayVisible = false;
      notifyListeners();
    });
  }

  toggleAddedToFavoritesOverlay() async {
    addedToFavoritesOverlayVisible = true;
    isFavorite = true;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 1000), () {
      addedToFavoritesOverlayVisible = false;
      notifyListeners();
    });
  }
}
