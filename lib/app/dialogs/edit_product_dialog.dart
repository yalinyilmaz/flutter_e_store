import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/formatter/custom_number_input_formatter.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/model/category_model.dart';
import 'package:flutter_e_store/feature/home/model/product_model.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_add_product_choose_category.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_add_product_inputfield.dart';
import 'package:flutter_e_store/main.dart';
import 'package:go_router/go_router.dart';

class EditProductDialog extends StatelessWidget {
  EditProductDialog({
    super.key,
    required this.nameController,
    required this.priceController,
    required this.product,
  });

  final TextEditingController nameController;
  final TextEditingController priceController;
  final ProductModel product;

  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Ürünü Düzenle',
        style: context.textTheme.title3Emphasized
            .copyWith(color: const Color.fromARGB(255, 133, 78, 187)),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ürün adı',
              style: context.textTheme.subheadlineRegular
                  .copyWith(color: const Color.fromARGB(255, 133, 78, 187)),
            ),
            const SizedBox(height: 5),
            ProductInfoInputField(
              hintText: "Ürün adı giriniz",
              controller: nameController,
              onChanged: (p0) {},
            ),
            const SizedBox(height: 16),
            Text(
              'Ürün fiyatı',
              style: context.textTheme.subheadlineRegular
                  .copyWith(color: const Color.fromARGB(255, 133, 78, 187)),
            ),
            const SizedBox(height: 5),
            ProductInfoInputField(
              hintText: "Ürün fiyatı giriniz",
              controller: priceController,
              onChanged: (p0) {},
              inputFormatters: [CustomNumberInputFormatter()],
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            Text(
              'Ürün kategorisi',
              style: context.textTheme.subheadlineRegular
                  .copyWith(color: const Color.fromARGB(255, 133, 78, 187)),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 40,
              child: ChooseCategory(
                initialValue: product.categories!.isNotEmpty
                    ? product.categories![0].name
                    : null,
                onSelected: (category) {
                  selectedCategory = category;
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    buttonSize: ButtonSize.small,
                    text: "İptal",
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
                    text: "Kaydet",
                    onButtonPressed: (p0) {
                      product.name = nameController.text;
                      product.price1 = double.tryParse(priceController.text
                          .replaceAll(".", "")
                          .replaceAll(",", "."));
                      if (selectedCategory != null) {
                        product.categories = [];
                        product.categories!.add(selectedCategory!);
                      }
                      container
                          .read(productManagerProvider)
                          .editProduct(id: product.id, product: product);
                      globalCtx.pop();
                    },
                    isPrimary: true,
                    customColor: const Color.fromARGB(255, 133, 78, 187),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
