import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/model/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseCategory extends ConsumerStatefulWidget {
  const ChooseCategory({
    super.key,
    required this.onSelected,
    this.initialValue,
    this.showAllButton = false,
  });

  final String? initialValue;
  final bool showAllButton;
  final void Function(CategoryModel) onSelected;

  @override
  ConsumerState<ChooseCategory> createState() => _ChooseCategoryState();
}

class _ChooseCategoryState extends ConsumerState<ChooseCategory> {
  late ValueNotifier<String?> selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = ValueNotifier<String>(widget.initialValue ?? "");
  }

  @override
  void dispose() {
    selectedCategory.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(getCategoriesProvider).when(
          data: (categories) {
            return SizedBox(
              height: 40,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ValueListenableBuilder(
                    valueListenable: selectedCategory,
                    builder: (context, e, r) {
                      return Row(
                        children: [
                          SizedBox(width: widget.showAllButton ? 10 : 0),
                          widget.showAllButton
                              ? AnimatedFadeButton(
                                  onTap: () {
                                    selectedCategory.value = "";
                                    ref
                                        .read(selectedCategoryProvider.notifier)
                                        .state = "";
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: selectedCategory.value!.isEmpty
                                          ? const Color.fromARGB(
                                              255, 133, 78, 187)
                                          : null,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 133, 78, 187),
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Tümü",
                                          style: context
                                              .textTheme.bodyEmphasized
                                              .copyWith(
                                            color: selectedCategory
                                                    .value!.isEmpty
                                                ? context.whiteColor.shade100
                                                : const Color.fromARGB(
                                                    255, 133, 78, 187),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Row(
                            children: categories.map((category) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6.0),
                                child: AnimatedFadeButton(
                                  onTap: () {
                                    selectedCategory.value = category.name;
                                    widget.onSelected.call(category);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: selectedCategory.value ==
                                              category.name
                                          ? const Color.fromARGB(
                                              255, 133, 78, 187)
                                          : null,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 133, 78, 187),
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          category.name,
                                          style: context
                                              .textTheme.bodyEmphasized
                                              .copyWith(
                                            color: selectedCategory.value ==
                                                    category.name
                                                ? context.whiteColor.shade100
                                                : const Color.fromARGB(
                                                    255, 133, 78, 187),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }),
              ),
            );
          },
          error: (error, stackTrace) =>
              const Center(child: Text("Bir Hata Oluştu.")),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
