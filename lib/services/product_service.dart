import 'package:dionniebee/app/helpers/error_definitions.dart';
import 'package:dionniebee/app/models/product_dto.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

mixin SupabaseMixin<T> on ListenableServiceMixin {
  final _supabase = Supabase.instance.client;
  late final String table;

  /// Converts json response into data class model. E.g:
  /// transformer = (e) { return ProductDto.fromJson(e); };
  late final T Function(dynamic) transformer;

  final ReactiveValue<List<T>> _items = ReactiveValue<List<T>>([]);
  List<T> get items => _items.value;

  Future fetchAll() async {
    assert(table.isNotEmpty, 'Table name must not be empty');
    assert(transformer != () {}, 'Transformer function must be provided');
    try {
      final session = _supabase.auth.currentSession;

      if (session != null && session.isExpired) {
        await _supabase.auth.refreshSession();
      }
      final data = await _supabase.from(table).select('*');
      if (data is List && data.isNotEmpty) {
        _items.value = data.map((e) {
          return transformer(e);
        }).toList();
        print(_items.value);
      }
    } catch (e) {
      return Future.error(errorDefinition(e.toString()));
    }
  }
}

class ProductService with ListenableServiceMixin, SupabaseMixin<ProductDto> {
  ProductService() {
    table = "products";
    transformer = (e) {
      return ProductDto.fromJson(e);
    };
    listenToReactiveValues([items]);
  }
}
