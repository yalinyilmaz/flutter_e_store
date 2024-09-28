import 'package:dio/dio.dart';
import 'package:flutter_e_store/feature/home/model/product_model.dart';
import 'package:flutter_e_store/feature/home/model/product_request_model.dart';
import 'package:retrofit/retrofit.dart';

part 'product_client.g.dart';

@RestApi()

abstract class ProductClient {
  factory ProductClient(Dio dio, {String baseUrl}) = _ProductClient;

  @GET("/products")
  Future<List<ProductModel>> getProductList();

  @POST("/products")
  Future<void> addProduct(
    @Body() ProductRequestModel requestModel
  );
}