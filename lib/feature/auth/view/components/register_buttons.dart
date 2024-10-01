import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/dialogs/new_message_dialog.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/validators/email_validator.dart';
import 'package:flutter_e_store/core/validators/tr_phone_number_validator.dart';
import 'package:flutter_e_store/feature/auth/manager/auth_manager.dart';
import 'package:flutter_e_store/feature/home/view/home_page.dart';
import 'package:flutter_e_store/main.dart';
import 'package:go_router/go_router.dart';

class RegisterButtons extends StatelessWidget {
  const RegisterButtons({
    super.key,
    required this.passwordTextController,
    required this.emailTextController,
    required this.phoneTextController,
    required this.nameTextController,
    required this.surnameTextController,
  });

  final TextEditingController emailTextController;
  final TextEditingController passwordTextController;
  final TextEditingController phoneTextController;
  final TextEditingController nameTextController;
  final TextEditingController surnameTextController;

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
              if (_checkAllFieldsCorrect()) {
                container.read(authManagerProvider).userRegister(
                    email: emailTextController.text,
                    password: passwordTextController.text);
              } else {
                MessageDialog.singleButton(
                    purpose: MessageDialogPurpose.warning,
                    caption: "Bilgiler Eksik",
                    content: "Lütfen zorunlu alanları doldurunuz");
              }
            },
          ),
        ),
      ],
    );
  }

  bool _checkAllFieldsCorrect() {
    return
        NewEmailValidator().isValid(emailTextController.text) &&
        passwordTextController.text.length > 5 &&
        TRPhoneValidator().isValid(phoneTextController.text) &&
        nameTextController.text.isNotEmpty &&
            surnameTextController.text.isNotEmpty;
  }
}
