import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/formatter/money_formatter.dart';
import 'package:flutter_e_store/feature/home/model/product_model.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 133, 78, 187)),
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: product.images!.isNotEmpty
                ? NetworkImage("https:${product.images![0].thumbUrl}")
                : Assets.images.mainLogo.provider(),
            fit: product.images!.isEmpty ? BoxFit.fill : BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert,
                      color: globalCtx.darkColor.shade800),
                  onSelected: (String result) {
                    switch (result) {
                      case 'edit':
                        // TODO: Implement edit functionality

                        break;
                      case 'delete':
                        // TODO: Implement delete functionality

                        break;
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('Düzenle'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Sil'),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${MoneyFormatter.formatAll(product.price1 ?? 0)} ${product.currency.label}",
                      style: context.textTheme.subheadlineEmphasized
                          .copyWith(color: globalCtx.whiteColor.shade100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      product.name,
                      style: TextStyle(color: globalCtx.whiteColor.shade100),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
