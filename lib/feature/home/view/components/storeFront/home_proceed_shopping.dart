import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/auth/view/login_page.dart';
import 'package:flutter_e_store/feature/home/view/products_list_page.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

class ProceedShopping extends StatelessWidget {
  const ProceedShopping({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: globalCtx.darkColor.shade900),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    "OYUNUN KURALLARINI BELİRLE!",
                    style: context.textTheme.title3Emphasized
                        .copyWith(color: globalCtx.whiteColor.shade100),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CustomElevatedButton(
                  onButtonPressed: (p0) {
                    if (FirebaseAuth.instance.currentUser == null) {
                      globalCtx.push(LoginPage.routeName);
                    } else {
                      globalCtx.push(ProductsListPage.routeName);
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_outlined),
                  text: "ALIŞVERİŞE BAŞLA",
                  isPrimary: false,
                  buttonSize: ButtonSize.medium,
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Assets.images.shoes1.image(),
                  const SizedBox(width: 15),
                  Assets.images.shoes2.image(),
                  const SizedBox(width: 15),
                  Assets.images.shoes3.image(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
