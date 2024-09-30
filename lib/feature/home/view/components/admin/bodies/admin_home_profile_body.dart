import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/dialogs/new_message_dialog.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/auth/view/choose_your_panel.dart';
import 'package:go_router/go_router.dart';

class AdminHomeProfileBody extends StatelessWidget {
  const AdminHomeProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 133, 78, 187),
              radius: 40,
              child: Icon(
                Icons.person,
                size: 40,
                color: globalCtx.whiteColor.shade100,
              ),
            ),
            const SizedBox(height: 15),
            Text("testcase.myideasoft.com",
                style: context.textTheme.subheadlineEmphasized),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    customColor: const Color.fromARGB(255, 133, 78, 187),
                    textStyle: context.textTheme.bodyRegular
                        .copyWith(color: context.whiteColor.shade100),
                    enabled: true,
                    text: "Çıkış Yap",
                    onButtonPressed: (p0) {
                      MessageDialog.twoButtons(
                          textColor: const Color.fromARGB(255, 133, 78, 187),
                          backButtonText: "Vazgeç",
                          forwardButtonText: "Onayla",
                          onForwardButtonPressed: () {
                            context.go(ChoosePanelPage.routeName);
                          },
                          purpose: MessageDialogPurpose.warning,
                          caption: "Bilgilendirme",
                          content: "Çıkış yapmak istediğinize emin misiniz?");
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 30)
          ],
        ));
  }
}
