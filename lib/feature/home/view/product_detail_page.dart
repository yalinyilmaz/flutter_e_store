import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/formatter/money_formatter.dart';
import 'package:flutter_e_store/feature/home/model/product_model.dart';
import 'package:flutter_e_store/feature/home/view/components/storeFront/product_list_header.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsDetailPage extends ConsumerStatefulWidget {
  const ProductsDetailPage({super.key, required this.product});
  static const routeName = "/home/product_detail";

  final ProductModel product;

  @override
  ConsumerState<ProductsDetailPage> createState() => _ProductsDetailPageState();
}

class _ProductsDetailPageState extends ConsumerState<ProductsDetailPage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currentPage = (_pageController.page ?? 0).toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ProductPageHeader(showSearchBar: false),
          Expanded(
            child: SizedBox(
              child: Stack(
                children: [
                  if (widget.product.images!.isNotEmpty)
                    Positioned.fill(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.product.images!.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            "https:${widget.product.images![index].thumbUrl}",
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    )
                  else
                    Positioned.fill(
                      child: Image(
                        image: Assets.images.mainLogo.provider(),
                        fit: BoxFit.fill,
                      ),
                    ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: DotsIndicator(
                      decorator: const DotsDecorator(activeColor: Color.fromARGB(255, 133, 78, 187) ),
                      dotsCount: widget.product.images?.length ?? 1,
                      position: _currentPage,
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
                        "${MoneyFormatter.formatAll(widget.product.price1 ?? 0)} ${widget.product.currency.label}",
                    textStyle: globalCtx.textTheme.title2Emphasized),
                const SizedBox(height: 10),
                _buildDetailLine(
                    title: "Ürün Adı:  ",
                    value: widget.product.name,
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
