import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/inputfields/custom_text_field.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';
import 'package:flutter_e_store/feature/auth/view/login_page.dart';
import 'package:flutter_e_store/feature/home/view/home_profile_page.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.whiteColor.shade500,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Assets.images.mainLogo.image(scale: 2),
                const Spacer(),
                AnimatedFadeButton(
                    onTap: () {
                      if(FirebaseAuth.instance.currentUser == null){
                        globalCtx.go(LoginPage.routeName);
                      }else{
                        globalCtx.push(ProfilePage.routeName);
                      }
                    },
                    child: Icon(Icons.person_outlined,
                        color: context.darkColor.shade500)),
                const SizedBox(width: 10),
                AnimatedFadeButton(
                    onTap: () {},
                    child: Icon(Icons.favorite_border,
                        color: context.darkColor.shade500)),
                const SizedBox(width: 10),
                AnimatedFadeButton(
                  onTap: () {},
                  child: Icon(Icons.shopping_bag_outlined,
                      color: context.darkColor.shade500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomTextField(
              labelText: "Aramak istediğiniz ürünü yazınız",
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
