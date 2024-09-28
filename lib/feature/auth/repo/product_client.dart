import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'product_client.g.dart';

@RestApi()

abstract class ProductClient {
  factory ProductClient(Dio dio, {String baseUrl}) = _ProductClient;

  @GET("/products")
  Future<void> getProductList();
}