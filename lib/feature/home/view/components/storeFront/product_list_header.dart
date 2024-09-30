import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/inputfields/custom_text_field.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/feature/home/view/home_page.dart';
import 'package:flutter_e_store/main.dart';
import 'package:go_router/go_router.dart';

class ProductPageHeader extends StatefulWidget {
  const ProductPageHeader({super.key, this.showSearchBar = true});

  final bool showSearchBar;

  @override
  State<ProductPageHeader> createState() => _ProductPageHeaderState();
}

class _ProductPageHeaderState extends State<ProductPageHeader> {
  bool isFavorite = false;

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
                  widget.showSearchBar
                      ? globalCtx.go(HomePage.routeName)
                      : globalCtx.pop();
                },
                color: globalCtx.whiteColor.shade100,
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                "Ürün ${widget.showSearchBar ? "Listesi" : "Detayı"}",
                style: context.textTheme.title3Emphasized
                    .copyWith(color: globalCtx.whiteColor.shade100),
              ),
              Spacer(
                flex: widget.showSearchBar ? 3 : 2,
              ),
              widget.showSearchBar
                  ? const SizedBox.shrink()
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: globalCtx.whiteColor.shade100,
                      ),
                    )
            ],
          ),
          widget.showSearchBar
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTextField(
                    autoFocus: true,
                    labelText: "Aramak istediğiniz ürünü yazınız",
                    onChanged: (name) {
                      container
                          .read(searchedByProductnameProvider.notifier)
                          .state = name;
                    },
                    isRequired: false,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: context.darkColor.shade900,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
