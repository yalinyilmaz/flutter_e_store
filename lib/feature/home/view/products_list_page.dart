import 'package:flutter/material.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_add_product_choose_category.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/product_card.dart';
import 'package:flutter_e_store/feature/home/view/components/storeFront/product_list_header.dart';
import 'package:flutter_e_store/feature/home/view/product_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductsListPage extends ConsumerWidget {
  const ProductsListPage({super.key});
  static const routeName = "/home/product_list";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: Column(
            children: [
              const ProductPageHeader(),
              const SizedBox(height: 15),
              ChooseCategory(
                showAllButton: true,
                onSelected: (category) {
                  ref.read(selectedCategoryProvider.notifier).state =
                      category.name;
                },
              ),
              Expanded(
                child: ref.watch(getSearchedProductsProvider).when(
                      data: (products) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RefreshIndicator(
                            onRefresh: () async {
                              ref.invalidate(getProductsProvider);
                            },
                            child: GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  final product = products[index];
                                  return AnimatedFadeButton(
                                      onTap: () {
                                        context.push(
                                            ProductsDetailPage.routeName,
                                            extra: product);
                                      },
                                      child: ProductCard(
                                          notEditable: true, product: product));
                                }),
                          ),
                        );
                      },
                      error: (error, stackTrace) => const Center(
                        child: Text("Bir Hata Oluştu."),
                      ),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
