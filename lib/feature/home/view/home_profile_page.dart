import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_buttons/new_custom_elevated_button.dart';
import 'package:flutter_e_store/app/dialogs/new_message_dialog.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/auth/manager/auth_manager.dart';
import 'package:flutter_e_store/main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const routeName = '/home/profile_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(color: context.whiteColor.shade600),
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Row(children: [BackButton()]),
                CircleAvatar(
                  backgroundColor: context.greyColor.shade500.withOpacity(.4),
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: globalCtx.darkColor.shade900,
                  ),
                ),
                const SizedBox(height: 15),
                Text(FirebaseAuth.instance.currentUser!.email!,
                    style: context.textTheme.subheadlineEmphasized),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        textStyle: context.textTheme.bodyRegular
                            .copyWith(color: context.whiteColor.shade100),
                        enabled: true,
                        text: "Çıkış Yap",
                        onButtonPressed: (p0) {
                          MessageDialog.twoButtons(
                              backButtonText: "Vazgeç",
                              forwardButtonText: "Onayla",
                              onForwardButtonPressed: () {
                                container.read(authManagerProvider).logout();
                              },
                              purpose: MessageDialogPurpose.warning,
                              caption: "Bilgilendirme",
                              content:
                                  "Çıkış yapmak istediğinize emin misiniz?");
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
                        textStyle: context.textTheme.bodyRegular,
                        enabled: true,
                        isPrimary: false,
                        text: "Hesabı Sil",
                        onButtonPressed: (p0) {
                          MessageDialog.twoButtons(
                              backButtonText: "Vazgeç",
                              forwardButtonText: "Onayla",
                              onForwardButtonPressed: () {
                                container
                                    .read(authManagerProvider)
                                    .deleteAccount();
                              },
                              purpose: MessageDialogPurpose.warning,
                              caption: "Bilgilendirme",
                              content:
                                  "Hesabınız kalıcı olarak silinecektir.Onaylıyor musunuz?");
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30)
              ],
            )),
      ),
    );
  }
}
