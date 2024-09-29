import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:flutter_e_store/app/api/api.dart';
import 'package:flutter_e_store/app/store/app_store.dart';
import 'package:flutter_e_store/feature/home/model/currency_model.dart';
import 'package:flutter_e_store/feature/home/model/image_model.dart';
import 'package:flutter_e_store/feature/home/model/product_model.dart';
import 'package:flutter_e_store/feature/home/model/product_request_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

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

  Future<void> addProduct({required File image}) async {
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

    final request = ProductRequestModel(
      currency: CurrencyModel(id: 1, label: "USD"),
      id: Random().nextInt(1000),
      name: 'bebek2',
      price1: 12,
      sku: const Uuid().v4(),
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
    await api.product.addProduct(request);
  }

  Future<void> deleteProduct({required int id}) async {
    AppStore.setAppBussy();
    await api.product.deleteProduct(id);
    ref.invalidate(getProductsProvider);
    AppStore.setAppIdle();
    
  }
}
