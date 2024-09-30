import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_dropdown_button.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/dialogs/new_message_dialog.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';
import 'package:flutter_e_store/core/formatter/custom_number_input_formatter.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/model/category_model.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_add_product_choose_category.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_add_product_image_preview.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_add_product_inputfield.dart';
import 'package:flutter_e_store/main.dart';
import 'package:image_picker/image_picker.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({super.key});

  @override
  State<AddProductBody> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddProductBody> {
  final picker = ImagePicker();
  List<File> images = [];
  CategoryModel? selectedCategory;
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  Currency selectedCurrency = Currency.tl;
  final ScrollController _scrollController = ScrollController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final itemWidth =
        MediaQuery.of(context).size.height / 2.5 + 16; // Image width + padding
    final newPageIndex = (_scrollController.offset / itemWidth).round();
    if (newPageIndex != _currentPageIndex) {
      setState(() {
        _currentPageIndex = newPageIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            CustomElevatedButton(
              isPrimary: false,
              customColor: const Color.fromARGB(255, 133, 78, 187),
              buttonSize: ButtonSize.small,
              text: "Ürünü Ekle",
              onButtonPressed: (p0) async {
                await _checkAndAddProduct();
              },
            ),
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.sizeOf(context).height / 2,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 133, 78, 187)),
                  borderRadius: BorderRadius.circular(12)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ImagePreviewList(
                        scrollController: _scrollController,
                        images: images,
                        currentPageIndex: _currentPageIndex),
                    Row(
                      children: [
                        Expanded(
                          child: ProductInfoInputField(
                            hintText: "Ürün fiyatı giriniz",
                            controller: priceController,
                            inputFormatters: [CustomNumberInputFormatter()],
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            onChanged: (p0) {},
                          ),
                        ),
                        NewCustomDropdownButton(
                          onChanged: (symbol) {
                            selectedCurrency = Currency.fromSymbol(symbol);
                          },
                          initialValue: "₺",
                          items: Currency.values
                              .map((currency) => currency.symbol)
                              .toList(),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: globalCtx.whiteColor.shade100,
                          ),
                          customColor: const Color.fromARGB(255, 133, 78, 187),
                        ),
                        const SizedBox(width: 10)
                      ],
                    ),
                    const SizedBox(height: 15),
                    ProductInfoInputField(
                      hintText: "Ürün adı giriniz",
                      controller: nameController,
                      onChanged: (p0) {},
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Text(
                            "Kategori Seçimi(Zorunlu değil)",
                            style: context.textTheme.subheadlineRegular
                                .copyWith(
                                    color:
                                        const Color.fromARGB(255, 133, 78, 187),
                                    fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    ChooseCategory(
                      onSelected: (selected) {
                        selectedCategory = selected;
                      },
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedFadeButton(
              onTap: () {
                _getImage(ImageSource.camera);
              },
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 133, 78, 187)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.add_a_photo,
                    color: globalCtx.whiteColor.shade100,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                      buttonSize: ButtonSize.large,
                      text: "Galeriden Seç",
                      enabled: true,
                      customColor: const Color.fromARGB(255, 133, 78, 187),
                      isPrimary: true,
                      onButtonPressed: (value) async {
                        await _getImage(ImageSource.gallery);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _checkAndAddProduct() async {
    if (images.isEmpty) {
      MessageDialog.singleButton(
          purpose: MessageDialogPurpose.warning,
          caption: "Görsel Bulunamadı",
          content: "Lütfen ürün görselini ekleyiniz.",
          textColor: const Color.fromARGB(255, 133, 78, 187));
    } else if (priceController.text.isEmpty || nameController.text.isEmpty) {
      MessageDialog.singleButton(
          purpose: MessageDialogPurpose.warning,
          caption: "Ürün Bilgileri Eksik",
          content: "Lütfen ürün bilgilerini eksiksiz giriniz.",
          textColor: const Color.fromARGB(255, 133, 78, 187));
    } else {
      await container.read(productManagerProvider).addProduct(
          images: images,
          name: nameController.text,
          price: double.tryParse(priceController.text
                  .replaceAll(".", "")
                  .replaceAll(",", ".")) ??
              0,
          currency: selectedCurrency,
          categoryModel: selectedCategory);
    }
  }

  Future<void> _getImage(ImageSource source) async {
    if (images.length >= 3) {
      MessageDialog.singleButton(
          purpose: MessageDialogPurpose.warning,
          textColor: const Color.fromARGB(255, 133, 78, 187),
          caption: "Bilgilendirme",
          content: "En fazla 3 adet görsel ekleyebilirsiniz!");
    } else {
      final pickedImage = await picker.pickImage(source: source);
      if (pickedImage != null) {
        setState(() {
          images.add(File(pickedImage.path));
        });
      }
    }
  }
}
