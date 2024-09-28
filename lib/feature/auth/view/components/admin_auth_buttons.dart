import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/auth/manager/auth_manager.dart';
import 'package:flutter_e_store/feature/auth/view/choose_your_panel.dart';
import 'package:flutter_e_store/feature/home/manager/product_manager.dart';
import 'package:flutter_e_store/main.dart';
import 'package:go_router/go_router.dart';

class AdminAuthButtons extends StatelessWidget {
  const AdminAuthButtons({
    super.key,
  });

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
              globalCtx.go(ChoosePanelPage.routeName);
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
            text: "Mağazanı Kaydet",
            onButtonPressed: (p0) async {
              container.read(productManagerProvider).getProductList();
            },
          ),
        ),
      ],
    );
  }
}
