import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_store/app/components/inputfields/custom_text_field.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/formatter/tr_phone_input_formatter.dart';
import 'package:flutter_e_store/core/validators/tr_phone_number_validator.dart';
import 'package:flutter_e_store/feature/auth/view/components/register_buttons.dart';
import 'package:flutter_e_store/feature/auth/view/components/register_contracts.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({super.key});

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  final _selectedGender = ValueNotifier<String?>(null);

  final phoneTextController = TextEditingController(text: "+90 ");

  final emailTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  final nameTextController = TextEditingController();

  final surnameTextController = TextEditingController();

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
              "Yeni Üyelik",
              style: context.textTheme.headlineRegular
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            CustomTextField(
              labelText: "Ad",
              isRequired: true,
              onChanged: (value) {
                setState(() {
                  nameTextController.text = value;
                });
              },
              validator: (p0) {
                return MultiValidator([
                  RequiredValidator(errorText: "Ad alanı boş olamaz"),
                ]).call(p0);
              },
            ),
            const SizedBox(height: 15),
            CustomTextField(
              onChanged: (value) {
                setState(() {
                  surnameTextController.text = value;
                });
              },
              labelText: "Soyad",
              isRequired: true,
              validator: (p0) {
                return MultiValidator([
                  RequiredValidator(errorText: "Soyad alanı boş olamaz"),
                ]).call(p0);
              },
            ),
            const SizedBox(height: 15),
            CustomTextField(
              onChanged: (value) {
                setState(() {
                  emailTextController.text=value;
                });
              },
              controller: emailTextController,
              labelText: "E-mail",
              isRequired: true,
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
              onChanged: (value) {
                setState(() {
                  passwordTextController.text = value;
                });
              },
              keyboardType: TextInputType.text,
              controller: passwordTextController,
              labelText: "Şifre",
              isRequired: true,
              suffixBuilder: (obscured, hovering) => Icon(
                obscured ? Icons.visibility_off : Icons.visibility,
                color: globalCtx.darkColor.shade100,
              ),
              validator: (p0) {
                return MultiValidator([
                  RequiredValidator(errorText: "Şifre alanı boş olamaz"),
                  MinLengthValidator(6,
                      errorText: "Şifre en az 6 karakter olmalıdır"),
                ]).call(p0);
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Cinsiyet",
                  style: globalCtx.textTheme.caption1Regular,
                ),
              ],
            ),
            ValueListenableBuilder(
                valueListenable: _selectedGender,
                builder: (context, e, r) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRadioListile(title: "Erkek", widht: 90),
                      _buildRadioListile(title: "Kadın", widht: 90),
                      _buildRadioListile(
                          title: "Belirtmek İstemiyorum", widht: 130),
                    ],
                  );
                }),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Cep Telefonu",
                  style: globalCtx.textTheme.caption1Regular,
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: phoneTextController,
              labelText: "Telefon numaranızı giriniz",
              isRequired: false,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(17),
                TRPhoneNumberFormatter()
              ],
              onChanged: (value) {
                if (!value.startsWith('+90 ')) {
                  phoneTextController.text = '+90 ';
                  phoneTextController.selection = TextSelection.fromPosition(
                    TextPosition(offset: phoneTextController.text.length),
                  );
                }
                setState(() {
                  phoneTextController.text = value;
                });
              },
              validator: (p0) {
                return MultiValidator([
                  MinLengthValidator(
                    5,
                    errorText: 'Telefon numarası alanı boş olamaz.',
                  ),
                  TRPhoneValidator(),
                ]).call(p0);
              },
            ),
            const SizedBox(height: 15),
            const Conracts(),
            const SizedBox(height: 15),
            RegisterButtons(
              nameTextController: nameTextController,
              surnameTextController: surnameTextController,
              phoneTextController: phoneTextController,
              emailTextController: emailTextController,
              passwordTextController: passwordTextController,
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _buildRadioListile({required String title, required double widht}) {
    return SizedBox(
      width: widht,
      child: RadioListTile<String>(
        activeColor: const Color.fromARGB(255, 133, 78, 187),
        title: Text(title),
        value: title,
        groupValue: _selectedGender.value,
        onChanged: (value) {
          _selectedGender.value = value;
        },
        dense: true,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}
