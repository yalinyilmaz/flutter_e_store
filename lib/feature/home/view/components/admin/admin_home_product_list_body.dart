import 'package:flutter/material.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/product_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminHomeProductListBody extends ConsumerWidget {
  const AdminHomeProductListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getProductsProvider).when(
          data: (products) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(getProductsProvider);
                },
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(product: product);
                    }),
              ),
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text("Bir Hata Oluştu."),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}


