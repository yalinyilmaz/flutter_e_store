import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/auth/manager/auth_manager.dart';
import 'package:flutter_e_store/feature/home/view/home_page.dart';
import 'package:flutter_e_store/main.dart';
import 'package:go_router/go_router.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({
    super.key,
    required this.passwordTextController,
    required this.emailTextController,
  });

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomElevatedButton(
            enabled: true,
            textStyle: context.textTheme.subheadlineEmphasized
                .copyWith(color: context.whiteColor.shade100),
            text: "İptal",
            onButtonPressed: (p0) {
              globalCtx.go(HomePage.routeName);
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomElevatedButton(
            enabled: true,
            textStyle: context.textTheme.subheadlineEmphasized
                .copyWith(color: context.whiteColor.shade100),
            customColor: const Color.fromARGB(255, 133, 78, 187),
            text: "Üye Ol",
            onButtonPressed: (p0) async {
              container.read(authManagerProvider).userRegister(
                  email: emailTextController.text,
                  password: passwordTextController.text);
            },
          ),
        ),
      ],
    );
  }
}
