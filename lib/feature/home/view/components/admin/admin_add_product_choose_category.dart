import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/model/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseCategory extends ConsumerWidget {
  ChooseCategory({
    super.key,
    required this.onSelected
  });

  final selectedCategory = ValueNotifier<String>("");
  final void Function(CategoryModel) onSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getCategoriesProvider).when(
          data: (categories) {
            return SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: ValueListenableBuilder(
                        valueListenable: selectedCategory,
                        builder: (context, e, r) {
                          return AnimatedFadeButton(
                            onTap: () {
                              selectedCategory.value = category.name;
                              onSelected.call(category);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: selectedCategory.value == category.name
                                      ? const Color.fromARGB(255, 133, 78, 187)
                                      : null,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 133, 78, 187))),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    category.name,
                                    style: context.textTheme.bodyEmphasized
                                        .copyWith(
                                            color: selectedCategory.value ==
                                                    category.name
                                                ? context.whiteColor.shade100
                                                : const Color.fromARGB(
                                                    255, 133, 78, 187)),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                },
              ),
            );
          },
          error: (error, stackTrace) =>
              const Center(child: Text("Bir Hata Oluştu.")),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
