import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/services/product_service.dart';
import 'package:stacked/stacked.dart';

class ProductViewModel extends BaseViewModel {
  final _productService = locator<ProductService>();

  ProductDto? _product;
  ProductDto? get product => _product;
  set product(val) {
    _product = val;
    notifyListeners();
  }

  void listenToPost(String id) {
    setBusy(true);
    _productService.getProductStream(id).listen((val) {
      _product = val;
      setBusy(false);
    });
  }
}
