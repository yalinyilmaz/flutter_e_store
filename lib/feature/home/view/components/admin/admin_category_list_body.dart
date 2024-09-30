import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminHomeCategoryListBody extends ConsumerWidget {
  const AdminHomeCategoryListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getCategoriesProvider).when(
          data: (categories) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(getProductsProvider);
                },
                child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 133, 78, 187)),
                              borderRadius: BorderRadius.circular(12)),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 133, 78, 187)),
                                ),
                                const SizedBox(width: 15),
                                Text(
                                  category.name,
                                  style: context.textTheme.bodyEmphasized,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
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
