import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/services/product_service.dart';
import 'package:fpdart/fpdart.dart';
import 'package:stacked/stacked.dart';

class ProductViewModel extends ReactiveViewModel {
  final _productService = locator<ProductService>();

  ProductDto? _product;
  ProductDto? get product => _product;

  Future init() async {
    await _productService.findx("N1OGZydwDOc93Eq6zQrj").run().then((value) {
      _product = value.getRight().toNullable();
      notifyListeners();
    });
  }
}
