import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/auth/view/admin_login_page.dart';
import 'package:flutter_e_store/feature/home/view/home_page.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';

class ChoosePanelPage extends StatelessWidget {
  const ChoosePanelPage({super.key});
  static const routeName = '/auth/choose_panel_page';

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
                Container(
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
                          "Panel Seçimi",
                          style: context.textTheme.headlineRegular
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: CustomElevatedButton(
                                customColor:
                                    const Color.fromARGB(255, 133, 78, 187),
                                textStyle: context.textTheme.bodyEmphasized
                                    .copyWith(
                                        color: context.whiteColor.shade100),
                                enabled: true,
                                text: "Müşteri Olarak Devam Et",
                                onButtonPressed: (p0) {
                                  globalCtx.go(HomePage.routeName);
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: CustomElevatedButton(
                                isPrimary: false,
                                textStyle: context.textTheme.bodyEmphasized,
                                enabled: true,
                                text: "Yönetim Paneli",
                                onButtonPressed: (p0) {
                                  globalCtx.go(AdminLoginPage.routeName);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
