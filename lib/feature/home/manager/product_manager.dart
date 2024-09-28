
import 'package:flutter_e_store/app/api/api.dart';
import 'package:flutter_e_store/feature/home/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProductsProvider =
    FutureProvider.autoDispose<List<ProductModel>>(
        (ref) async {
  List<ProductModel> products = await ref
      .read(productManagerProvider)
      .getProductList();
  return products;
});

final productManagerProvider = Provider<ProductManager>((ref) {
  return ProductManager(ref);
});

class ProductManager {
  ProductManager(this.ref);
  final Ref ref;

  Future<List<ProductModel>> getProductList() async {
    final response = await api.product.getProductList();
    return response;
  }
}
