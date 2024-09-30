import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/dialogs/new_message_dialog.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/model/category_model.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';
import 'package:flutter_e_store/main.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 133, 78, 187)),
            borderRadius: BorderRadius.circular(12)),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: category.imageUrl != null
                        ? NetworkImage(
                            "https:${category.imageUrl}",
                          )
                        : Assets.images.mainLogo.provider(),
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                category.name,
                style: context.textTheme.bodyEmphasized,
              ),
              const Spacer(),
              AnimatedFadeButton(
                onTap: () {
                  MessageDialog.twoButtons(
                      backButtonText: "Vazgeç",
                      forwardButtonText: "Sil",
                      onForwardButtonPressed: () {
                        container
                            .read(productManagerProvider)
                            .deleteCategory(id: category.id);
                        globalCtx.pop();
                      },
                      textColor: const Color.fromARGB(255, 133, 78, 187),
                      purpose: MessageDialogPurpose.warning,
                      caption: "Bilgilendirme",
                      content:
                          "Kategoriyi kaldırmak istediğinizden emin misniz?");
                },
                child: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 133, 78, 187),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
