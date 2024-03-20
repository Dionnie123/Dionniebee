import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/services/product_service.dart';

import 'package:stacked/stacked.dart';

class ProductViewModel extends ReactiveViewModel {
  final _productService = locator<ProductService>();

  ProductDto? _product;
  ProductDto? get product => _product;

  Future init() async {
    if (product?.id == null) return;
    await _productService.find(product!.id).then((value) {
      _product = value;
      notifyListeners();
    });
  }
}
