import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/dialogs/add_or_edit_category_dialog.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/model/category_model.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_add_product_inputfield.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/category_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
                AnimatedFadeButton(
                  onTap: () {
                    _showAddDialog(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1.5,
                            color: const Color.fromARGB(255, 133, 78, 187))),
                    child: const Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 133, 78, 187),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Add New Category",
                  style: globalCtx.textTheme.bodyEmphasized
                      .copyWith(color: const Color.fromARGB(255, 133, 78, 187)),
                ),
                const SizedBox(height: 30)
              ],
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text("Bir Hata Oluştu."),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }

  void _showAddDialog(BuildContext context) {

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const AddorEditCategory(title: "Yeni Kategori Ekle",buttonText: "Ekle",forAdd: true,);
      },
    );
  }
}


