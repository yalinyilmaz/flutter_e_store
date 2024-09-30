import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/category_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminHomeCategoryListBody extends ConsumerWidget {
  const AdminHomeCategoryListBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getCategoriesProvider).when(
          data: (categories) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Kategoriler",
                        style: globalCtx.textTheme.title3Emphasized.copyWith(
                            color: const Color.fromARGB(255, 133, 78, 187)),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: .7,
                  color: Color.fromARGB(255, 133, 78, 187),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        ref.invalidate(getCategoriesProvider);
                      },
                      child: ListView.builder(
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return CategoryCard(category: category);
                          }),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text("Bir Hata Oluştu."),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
