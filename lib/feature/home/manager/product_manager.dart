import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:flutter_e_store/app/api/api.dart';
import 'package:flutter_e_store/app/store/app_store.dart';
import 'package:flutter_e_store/feature/home/manager/admin_home_manager.dart';
import 'package:flutter_e_store/feature/home/model/category_model.dart';
import 'package:flutter_e_store/feature/home/model/currency_model.dart';
import 'package:flutter_e_store/feature/home/model/image_model.dart';
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

final getCategoriesProvider =
    FutureProvider.autoDispose<List<CategoryModel>>((ref) async {
  List<CategoryModel> categories =
      await ref.read(productManagerProvider).getCategoryList();
  return categories;
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
    required List<File> images,
    required String name,
    required double price,
    required Currency currency,
  }) async {
    int id = Random().nextInt(1000);
    String sku = const Uuid().v4();

    List<ImageModel> imageModels = await _generateImageModels(images);

    final requestAddProduct = ProductRequestModel(
      currency: CurrencyModel(id: currency.id, label: currency.label),
      id: id,
      name: name,
      price1: price,
      sku: sku,
      categories: [],
      images: imageModels,
    );

    AppStore.setAppBussy();
    await api.product.addProduct(requestAddProduct);
    selectedHomeFragments.value = AdminHomeFragments.productList;
    AppStore.setAppIdle();
  }

  Future<List<ImageModel>> _generateImageModels(List<File> images) async {
    List<ImageModel> imageModels = [];
    String directoryName = '008'; // This value could be determined dynamically
    String baseUrl = 'https://testcase.com/myassets/products/$directoryName';

    for (File image in images) {
      String fullName = image.path.split('/').last;
      String fileName = fullName.split('.').first;
      String extension = fullName.split('.').last;

      List<int> imageBytes = await image.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      String base64ImageWithPrefix = 'data:image/jpeg;base64,$base64Image';

      String revision = DateTime.now().millisecondsSinceEpoch.toString();
      String thumbUrl =
          '$baseUrl/${fileName}_min.$extension?revision=$revision';
      String originalUrl = '$baseUrl/$fileName.$extension?revision=$revision';

      ImageModel imageModel = ImageModel(
        id: Random().nextInt(1000),
        filename: fileName,
        extension: extension,
        thumbUrl: thumbUrl,
        originalUrl: originalUrl,
        attachment: base64ImageWithPrefix,
      );

      imageModels.add(imageModel);
    }

    return imageModels;
  }

  Future<void> deleteProduct({required int id}) async {
    AppStore.setAppBussy();
    await api.product.deleteProduct(id);
    ref.invalidate(getProductsProvider);
    AppStore.setAppIdle();
  }

  Future<void> editProduct(
      {required int id, required ProductModel product}) async {
    AppStore.setAppBussy();
    await api.product.editProduct(id, product);
    ref.invalidate(getProductsProvider);
    AppStore.setAppIdle();
  }

  Future<List<CategoryModel>> getCategoryList() async {
    final response = await api.product.getCategoryList();
    return response;
  }

  Future<void> addCategory({
    required String name,
  }) async {
    int id = Random().nextInt(1000);

    final requestAddCategory = CategoryModel(id: id, name: name);

    AppStore.setAppBussy();
    await api.product.addCategory(requestAddCategory);
    ref.invalidate(getCategoriesProvider);
    AppStore.setAppIdle();
  }

  Future<void> editCategory(
      {required int id, required CategoryModel category}) async {
    AppStore.setAppBussy();
    await api.product.editCategory(id, category);
    ref.invalidate(getCategoriesProvider);
    AppStore.setAppIdle();
  }

  Future<void> deleteCategory({required int id}) async {
    AppStore.setAppBussy();
    await api.product.deleteCategory(id);
    ref.invalidate(getCategoriesProvider);
    AppStore.setAppIdle();
  }
}
