import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_store/app/components/inputfields/custom_text_field.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/formatter/tr_phone_input_formatter.dart';
import 'package:flutter_e_store/core/validators/tr_phone_number_validator.dart';
import 'package:flutter_e_store/feature/auth/view/components/admin_auth_buttons.dart';
import 'package:flutter_e_store/feature/auth/view/components/register_contracts.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AdminAuthCard extends StatelessWidget {
  AdminAuthCard({super.key});

  final _selectedGender = ValueNotifier<String?>("Erkek");
  final phoneTextController = TextEditingController(text: "+90 530 879 28 24");
  final emailTextController =
      TextEditingController(text: "techadmin@ideasoft.com.tr");
  final passwordTextController = TextEditingController(text: "123456");
  final propertyNameTextController = TextEditingController(text: "Ideasoft");

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
              "Mağazanı Kaydet",
              style: context.textTheme.headlineRegular
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 15),
            CustomTextField(
              isReadOnly: true,
              controller: propertyNameTextController,
              labelText: "Mağaza Adınız",
              isRequired: true,
              validator: (p0) {
                return MultiValidator([
                  RequiredValidator(errorText: "Mağaza adı alanı boş olamaz"),
                ]).call(p0);
              },
            ),
            const SizedBox(height: 15),
            CustomTextField(
              isReadOnly: true,
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
              isReadOnly: true,
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
              isReadOnly: true,
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
            const Conracts(
              initialValue: true,
            ),
            const SizedBox(height: 15),
            const AdminAuthButtons(),
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
