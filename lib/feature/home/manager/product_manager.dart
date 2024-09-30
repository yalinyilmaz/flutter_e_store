import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:flutter_e_store/app/api/api.dart';
import 'package:flutter_e_store/app/store/app_store.dart';
import 'package:flutter_e_store/feature/home/manager/admin_home_manager.dart';
import 'package:flutter_e_store/feature/home/model/category.dart';
import 'package:flutter_e_store/feature/home/model/category_request_model.dart';
import 'package:flutter_e_store/feature/home/model/currency_model.dart';
import 'package:flutter_e_store/feature/home/model/image_model.dart';
import 'package:flutter_e_store/feature/home/model/product.dart';
import 'package:flutter_e_store/feature/home/model/product_model.dart';
import 'package:flutter_e_store/feature/home/model/product_request_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

enum Currency {
  tl(3, "₺", "TL"),
  usd(1, "\$", "USD"),
  eur(2, "€", "EUR");

  final int id;
  final String symbol;
  final String label;

  const Currency(this.id, this.symbol, this.label);

  static Currency fromSymbol(String symbol) {
    return Currency.values.firstWhere((c) => c.symbol == symbol);
  }
}

final searchedByProductnameProvider = StateProvider.autoDispose<String>((ref) {
  return "";
});

final getSearchedProductsProvider =
    FutureProvider.autoDispose<List<ProductModel>>((ref) async {
  final searchedProductname = ref.watch(searchedByProductnameProvider);
  
  List<ProductModel> products = (await ref.watch(getProductsProvider.future))
      .where((product) =>
          (product.name).toLowerCase().contains(searchedProductname))
      .toList();
  return products;
});

final getProductsProvider =
    FutureProvider.autoDispose<List<ProductModel>>((ref) async {
  List<ProductModel> products =
      await ref.read(productManagerProvider).getProductList();
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

  Future<void> addProduct({
    required File image,
    required String name,
    required double price,
    required Currency currency,
  }) async {
    // Dosya adını ve uzantısını al
    String fullName = image.path.split('/').last;
    String fileName = fullName.split('.').first;
    String extension = fullName.split('.').last;

    // Resmi base64'e çevir
    List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    String base64ImageWithPrefix = 'data:image/jpeg;base64,$base64Image';

    // Yeni URL formatını oluştur
    String directoryName = '008'; // Bu değer dinamik olarak belirlenebilir
    String baseUrl = 'https://testcase.com/myassets/products/$directoryName';
    String revision = DateTime.now().millisecondsSinceEpoch.toString();

    String thumbUrl = '$baseUrl/${fileName}_min.$extension?revision=$revision';
    String originalUrl = '$baseUrl/$fileName.$extension?revision=$revision';

    int id = Random().nextInt(1000);
    String sku = const Uuid().v4();
    final requestAddProduct = ProductRequestModel(
      currency: CurrencyModel(id: currency.id, label: currency.label),
      id: id,
      name: name,
      price1: price,
      sku: sku,
      categories: [
        // {"id": Random().nextInt(100),
        // "product":id,
        // "category":1,
        // "sortOrder":1
        // }
      ],
      images: [
        ImageModel(
          id: Random().nextInt(1000),
          filename: fileName,
          extension: extension,
          thumbUrl: thumbUrl,
          originalUrl: originalUrl,
          attachment: base64ImageWithPrefix, // Yeni eklenen alan
        )
      ],
    );
    // final requestAddCategory = CategoryRequestModel(
    //     id: id,
    //     product: Product(id: id,fullName: name,sku: sku),
    //     category: Category(category: 1,id: 1),
    //     sortOrder: 1);
    AppStore.setAppBussy();
    await api.product.addProduct(requestAddProduct);
    //await api.product.addProductCategory(requestAddCategory);
    selectedHomeFragments.value = AdminHomeFragments.productList;
    AppStore.setAppIdle();
  }

  Future<void> deleteProduct({required int id}) async {
    AppStore.setAppBussy();
    await api.product.deleteProduct(id);
    ref.invalidate(getProductsProvider);
    AppStore.setAppIdle();
  }
}
