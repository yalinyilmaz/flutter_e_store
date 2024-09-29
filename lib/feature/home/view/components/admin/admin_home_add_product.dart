import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/dialogs/new_message_dialog.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';
import 'package:flutter_e_store/core/formatter/custom_number_input_formatter.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
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
  File? image;
  final TextEditingController priceController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

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
              onButtonPressed: (p0) {
                if (image == null) {
                  MessageDialog.singleButton(
                      purpose: MessageDialogPurpose.warning,
                      caption: "Görsel Bulunamadı",
                      content: "Lütfen ürün görselini ekleyiniz.",
                      textColor: const Color.fromARGB(255, 133, 78, 187));
                } else if (priceController.text.isEmpty ||
                    nameController.text.isEmpty) {
                  MessageDialog.singleButton(
                      purpose: MessageDialogPurpose.warning,
                      caption: "Ürün Bilgileri Eksik",
                      content: "Lütfen ürün bilgilerini eksiksiz giriniz.",
                      textColor: const Color.fromARGB(255, 133, 78, 187));
                } else {
                  container.read(productManagerProvider).addProduct(
                        image: image!,
                      );
                }
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
                    image != null
                        ? Image.file(
                            image!,
                            height: MediaQuery.sizeOf(context).height / 2.5,
                            width: MediaQuery.sizeOf(context).height / 2.5,
                            fit: BoxFit.cover,
                          )
                        : SizedBox(
                            height: MediaQuery.sizeOf(context).height / 2.5,
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 133, 78, 187),
                                size: 55,
                              ),
                            ),
                          ),
                    const SizedBox(height: 10),
                    ProductInfoInputField(
                      hintText: "Ürün fiyatı giriniz",
                      controller: priceController,
                      inputFormatters: [CustomNumberInputFormatter()],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (p0) {},
                    ),
                    const SizedBox(height: 15),
                    ProductInfoInputField(
                      hintText: "Ürün adı giriniz",
                      controller: nameController,
                      onChanged: (p0) {},
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedFadeButton(
              onTap: () {
                getImage(ImageSource.camera);
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
                        await getImage(ImageSource.gallery);
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> getImage(ImageSource source) async {
    final pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }
}
