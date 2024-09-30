import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/formatter/money_formatter.dart';
import 'package:flutter_e_store/feature/home/model/product_model.dart';
import 'package:flutter_e_store/feature/home/view/components/storeFront/product_list_header.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsDetailPage extends ConsumerWidget {
  const ProductsDetailPage({super.key, required this.product});
  static const routeName = "/home/product_detail";

  final ProductModel product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const ProductPageHeader(showSearchBar: false),
          Expanded(
            child: SizedBox(
              child: Stack(
                children: [
                  if (product.images!.isNotEmpty)
                    Positioned.fill(
                      child: RotatedBox(
                        quarterTurns: 1, // 90 derece sağa döndürme
                        child: Image.network(
                          "https:${product.images![0].thumbUrl}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  else
                    Positioned.fill(
                      child: Image(
                        image: Assets.images.mainLogo.provider(),
                        fit: BoxFit.fill,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _buildDetailLine(
                    title: "Ürün Fiyatı:  ",
                    value:
                        "${MoneyFormatter.formatAll(product.price1 ?? 0)} ${product.currency.label}",
                    textStyle: globalCtx.textTheme.title2Emphasized),
                const SizedBox(height: 10),
                _buildDetailLine(
                    title: "Ürün Adı:  ",
                    value: product.name,
                    textStyle: globalCtx.textTheme.title3Regular),
                const SizedBox(height: 10),
                _buildDetailLine(
                    title: "Ürün Açıklaması:  ",
                    value: "Yok",
                    textStyle: globalCtx.textTheme.title3Regular),
                const SizedBox(height: 10),
                Divider(color: context.greyColor.shade500),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 10),
                    Text("Çankaya, Ankara")
                  ],
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height / 3),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _buildDetailLine(
      {required String title,
      required String value,
      required TextStyle textStyle}) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            text: title,
            style: globalCtx.textTheme.subheadlineRegular
                .copyWith(color: globalCtx.darkColor.shade400),
            children: [
              TextSpan(
                style: textStyle.copyWith(color: globalCtx.darkColor.shade900),
                text: value,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
