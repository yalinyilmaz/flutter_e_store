import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/auth/view/components/login_card.dart';
import 'package:flutter_e_store/feature/auth/view/components/sign_in_buttons.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const routeName = '/auth/login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(color: context.whiteColor.shade600),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Assets.images.mainLogo.image(scale: 1.7),
                const SizedBox(height: 20),
                LoginCard(),
                const SizedBox(height: 20),
                Text(
                  "Henüz Üye Değil Misiniz?",
                  style: context.textTheme.headlineRegular
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 20),
                const SignInButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


