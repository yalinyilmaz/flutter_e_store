import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';
import 'package:flutter_e_store/feature/auth/view/login_page.dart';
import 'package:flutter_e_store/feature/home/view/components/storeFront/home_get_news_from_us.dart';
import 'package:flutter_e_store/feature/home/view/components/storeFront/home_infobox_list.dart';
import 'package:flutter_e_store/feature/home/view/components/storeFront/home_page_header.dart';
import 'package:flutter_e_store/feature/home/view/components/storeFront/home_proceed_shopping.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: globalCtx.whiteColor.shade600),
        child: Column(
          children: [
            const HomePageHeader(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Assets.images.exampleImg.image(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ÖNE ÇIKANLAR",
                          style: context.textTheme.title3Emphasized,
                        ),
                        const SizedBox(height: 10),
                        CustomElevatedButton(
                          onButtonPressed: (p0) {
                            if (FirebaseAuth.instance.currentUser == null) {
                              globalCtx.push(LoginPage.routeName);
                            }
                          },
                          icon: const Icon(Icons.arrow_forward_outlined),
                          isPrimary: false,
                          text: "Detayları incele",
                          buttonSize: ButtonSize.small,
                        ),
                      ],
                    ),
                  ),
                  const ProceedShopping(),
                  const SizedBox(height: 25),
                  _buildCategoryImages(
                    img: Assets.images.female.image(),
                    title: "KADIN",
                    onTap: () {},
                  ),
                  const SizedBox(height: 25),
                  _buildCategoryImages(
                    img: Assets.images.male.image(),
                    title: "ERKEK",
                    onTap: () {},
                  ),
                  const SizedBox(height: 25),
                  _buildCategoryImages(
                    img: Assets.images.kid.image(),
                    title: "ÇOCUK",
                    onTap: () {},
                  ),
                  const SizedBox(height: 25),
                  Assets.images.advertisementImg.image(),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                "ŞİMDİ, HAREKETE GEÇME ZAMANI!",
                                style: context.textTheme.title2Emphasized
                                    .copyWith(
                                        color: globalCtx.darkColor.shade900),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            CustomElevatedButton(
                              onButtonPressed: (p0) {
                                if (FirebaseAuth.instance.currentUser == null) {
                                  globalCtx.push(LoginPage.routeName);
                                }
                              },
                              icon: const Icon(Icons.arrow_forward_outlined),
                              text: "ALIŞVERİŞE BAŞLA",
                              isPrimary: false,
                              buttonSize: ButtonSize.medium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 45),
                      ],
                    ),
                  ),
                  const HomeGetNewsFromUs(),
                  const SizedBox(height: 25),
                  const HomeInfoboxList(),
                  const SizedBox(height: 25),
                  Assets.images.infos.image(),
                  const SizedBox(height: 25),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryImages(
      {required String title,
      required Widget img,
      required void Function() onTap}) {
    return AnimatedFadeButton(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          img,
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomElevatedButton(
              text: title,
              buttonSize: ButtonSize.small,
            ),
          )
        ],
      ),
    );
  }
}
