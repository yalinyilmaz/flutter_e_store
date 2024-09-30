import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/model/category_model.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_add_product_inputfield.dart';
import 'package:flutter_e_store/main.dart';
import 'package:go_router/go_router.dart';

class AddorEditCategory extends StatefulWidget {
  const AddorEditCategory({
    super.key,
    required this.title,
    required this.buttonText,
    required this.forAdd,
    this.category,
  });

  final String title;
  final String buttonText;
  final CategoryModel? category;
  final bool forAdd;

  @override
  State<AddorEditCategory> createState() => _AddorEditCategoryState();
}

class _AddorEditCategoryState extends State<AddorEditCategory> {
  late final TextEditingController nameController;
  @override
  void initState() {
    nameController = TextEditingController(
        text: widget.category != null ? widget.category!.name : "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.title,
        style: context.textTheme.title3Emphasized
            .copyWith(color: const Color.fromARGB(255, 133, 78, 187)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProductInfoInputField(
            hintText: "Kategori adı giriniz",
            controller: nameController,
            onChanged: (p0) {},
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomElevatedButton(
                  buttonSize: ButtonSize.small,
                  text: "Vazgeç",
                  onButtonPressed: (p0) {
                    context.pop();
                  },
                  isPrimary: false,
                  customColor: const Color.fromARGB(255, 133, 78, 187),
                ),
              ),
              const SizedBox(width: 7),
              Expanded(
                child: CustomElevatedButton(
                  buttonSize: ButtonSize.small,
                  text: widget.buttonText,
                  onButtonPressed: (p0) {
                    if (widget.forAdd && nameController.text.isNotEmpty) {
                      container
                          .read(productManagerProvider)
                          .addCategory(name: nameController.text);
                      globalCtx.pop();
                    }
                  },
                  isPrimary: true,
                  customColor: const Color.fromARGB(255, 133, 78, 187),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
