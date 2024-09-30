import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/inputfields/custom_text_field.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/view/home_page.dart';
import 'package:flutter_e_store/main.dart';
import 'package:go_router/go_router.dart';

class ProductListHeader extends StatelessWidget {
  const ProductListHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 133, 78, 187),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 133, 78, 187),
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              BackButton(
                onPressed: () {
                  globalCtx.go(HomePage.routeName);
                },
                color: globalCtx.whiteColor.shade100,
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                "Ürün Listesi",
                style: context.textTheme.title3Emphasized
                    .copyWith(color: globalCtx.whiteColor.shade100),
              ),
              const Spacer(
                flex: 3,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomTextField(
              autoFocus: true,
              labelText: "Aramak istediğiniz ürünü yazınız",
              onChanged: (name) {
                container.read(searchedByProductnameProvider.notifier).state =
                    name;
              },
              isRequired: false,
              prefixIcon: Icon(
                Icons.search_outlined,
                color: context.darkColor.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
