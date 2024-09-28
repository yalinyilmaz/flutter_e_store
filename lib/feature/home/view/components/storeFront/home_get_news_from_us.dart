import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/inputfields/custom_text_field.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';

class HomeGetNewsFromUs extends StatelessWidget {
  const HomeGetNewsFromUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.darkColor.shade900),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Text(
              "HABERLER VE ÖZEL FIRSATLAR İÇİN E-POSTA ADRESİNİ KAYDET!",
              style: context.textTheme.title2Emphasized
                  .copyWith(color: globalCtx.whiteColor.shade100),
            ),
            const SizedBox(height: 25),
            CustomTextField(
                suffixIcon: Icon(
                  Icons.arrow_forward_outlined,
                  color: context.darkColor.shade900,
                  weight: 16,
                ),
                padding: 16,
                labelText: "E-posta adresiniz",
                isRequired: false),
            const SizedBox(height: 25),
            Assets.images.boardGuy.image(),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
