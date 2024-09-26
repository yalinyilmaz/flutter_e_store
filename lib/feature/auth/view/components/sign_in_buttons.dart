import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/auth/manager/auth_manager.dart';
import 'package:flutter_e_store/feature/auth/view/register_page.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';
import 'package:flutter_e_store/main.dart';
import 'package:go_router/go_router.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                textStyle: context.textTheme.bodyEmphasized
                    .copyWith(color: context.whiteColor.shade100),
                enabled: true,
                text: "Hemen Üye Ol",
                onButtonPressed: (p0) {
                  globalCtx.push(RegisterPage.routeName);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                textStyle: context.textTheme.footnoteRegular,
                enabled: true,
                isPrimary: false,
                icon: Assets.images.googleIcon.image(width: 30),
                text: "Google ile Bağlan",
                onButtonPressed: (p0) {
                  container.read(authManagerProvider).userLoginWithGoogle();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                textStyle: context.textTheme.footnoteRegular,
                enabled: true,
                icon: Assets.images.facebookIcon.image(width: 30),
                isPrimary: false,
                text: "Facebook ile Bağlan",
                onButtonPressed: (p0) {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
