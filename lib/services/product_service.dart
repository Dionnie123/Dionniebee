import 'package:dionniebee/app/helpers/error_definitions.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:faker/faker.dart';

mixin MamaloanServiceMixin {
  foo() {}
}

class ProductService with ListenableServiceMixin, MamaloanServiceMixin {
  @override
  foo() {
    // TODO: implement foo
    return super.foo();
  }

  var faker = Faker();
  final _supabase = Supabase.instance.client;

  ProductService() {
    listenToReactiveValues([
      _products,
    ]);
  }
  final ReactiveValue<List<ProductDto>> _products =
      ReactiveValue<List<ProductDto>>([]);
  List<ProductDto> get products => _products.value;

  Future fetchAllProducts() async {
    try {
      final data = await _supabase.from('products').select('*');

      if (data is List && data.isNotEmpty) {
        // _products.value = data.map((e) => ProductDto.fromJson(e)).toList();
        _products.value = List.generate(30, (index) {
          var faker = Faker();
          return ProductDto(
            id: index,
            imageUrl: faker.image.image(
                keywords: ["fast food", "burger", "fries"], random: true),
            name: "${faker.food.dish()} ${faker.food.dish()}",
            description: faker.lorem.sentences(5).join(),
            price: faker.randomGenerator.integer(1000),
            quantityInCart: faker.randomGenerator.integer(100, min: 10),
            quantityInStock: faker.randomGenerator.integer(100, min: 10),
            createdAt: faker.date.dateTime(),
          );
        }).toList();
      }
    } catch (e) {
      //_supabase.auth.currentSession.expiresIn;
      return Future.error(errorDefinition(e.toString()));
    }
  }
}
