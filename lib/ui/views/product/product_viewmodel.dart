import 'package:dionniebee/app/app.locator.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:dionniebee/services/product_service.dart';
import 'package:stacked/stacked.dart';

class ProductViewModel extends StreamViewModel<ProductDto?> {
  final _productService = locator<ProductService>();
  ProductDto? get product => data;

  late String _productId;
  String get productId => _productId;
  set productId(String val) {
    _productId = val;
    notifySourceChanged(clearOldData: true);
  }

  @override
  Stream<ProductDto?> get stream => _productService.getItemStream(productId);
}
