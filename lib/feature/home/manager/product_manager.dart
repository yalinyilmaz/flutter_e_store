import 'package:flutter_e_store/app/api/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productManagerProvider = Provider<ProductManager>((ref) {
  return ProductManager(ref);
});

class ProductManager {
  ProductManager(this.ref);
  final Ref ref;

  Future<void> getProductList() async {
    await api.product.getProductList();
  }
}
