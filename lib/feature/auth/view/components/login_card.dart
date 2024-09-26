import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/components/custom_checkbox/custom_checkbox.dart';
import 'package:flutter_e_store/app/components/inputfields/custom_text_field.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginCard extends StatelessWidget {
  LoginCard({
    super.key,
  });

  final isChecked = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.whiteColor.shade300,
        border: Border.all(color: context.greyColor.shade300),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "Giriş Yap",
              style: context.textTheme.headlineRegular
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            CustomTextField(
              labelText: "E-mail",
              isRequired: false,
              validator: (p0) {
                return MultiValidator([
                  RequiredValidator(
                      errorText: "E-posta adresi alanı boş olamaz"),
                  EmailValidator(
                      errorText: "Lütfen geçerli bir e-mail adresi giriniz")
                ]).call(p0);
              },
            ),
            const SizedBox(height: 15),
            CustomTextField.obscure(
              labelText: "Şifre",
              isRequired: false,
              suffixBuilder: (obscured, hovering) => Icon(
                obscured ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                color: globalCtx.darkColor.shade100,
              ),
              validator: (p0) {
                return MultiValidator([
                  RequiredValidator(errorText: "Şifre alanı boş olamaz"),
                ]).call(p0);
              },
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                ValueListenableBuilder(
                    valueListenable: isChecked,
                    builder: (context, c, b) {
                      return CustomCheckbox(
                        isChecked: isChecked.value,
                        onTap: () {
                          isChecked.value = !isChecked.value;
                        },
                      );
                    }),
                const SizedBox(width: 15),
                Text(
                  "Beni Hatırla",
                  style: context.textTheme.footnoteEmphasized
                      .copyWith(color: context.darkColor.shade900),
                ),
                const Spacer(),
                AnimatedFadeButton(
                  onTap: () {},
                  child: Text(
                    "Şifremi unuttum",
                    style: context.textTheme.footnoteEmphasized
                        .copyWith(color: context.darkColor.shade900),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    enabled: true,
                    textStyle: context.textTheme.bodyEmphasized
                        .copyWith(color: context.whiteColor.shade100),
                    customColor: const Color.fromARGB(255, 133, 78, 187),
                    text: "Giriş Yap",
                    onButtonPressed: (p0) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
