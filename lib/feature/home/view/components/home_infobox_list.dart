import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/dialogs/new_message_dialog.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/feature/auth/manager/auth_manager.dart';
import 'package:flutter_e_store/feature/auth/view/login_page.dart';
import 'package:flutter_e_store/feature/auth/view/register_page.dart';
import 'package:flutter_e_store/feature/home/model/infobox_content_model.dart';
import 'package:flutter_e_store/feature/home/view/components/home_info_box.dart';
import 'package:flutter_e_store/feature/home/view/home_profile_page.dart';
import 'package:flutter_e_store/main.dart';
import 'package:go_router/go_router.dart';

class HomeInfoboxList extends StatelessWidget {
  const HomeInfoboxList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHomeInfoBox(
          title: "Kurumsal",
          contents: [
            InfoboxContentModel(
              subtitle: "Hakkımızda",
              onTap: () {},
            ),
            InfoboxContentModel(
              subtitle: "Mağazalar",
              onTap: () {},
            ),
            InfoboxContentModel(
              subtitle: "İletişim",
              onTap: () {},
            ),
          ],
        ),
        _buildHomeInfoBox(
          title: "Yardım",
          contents: [
            InfoboxContentModel(
              subtitle: "Yardım Merkezi",
              onTap: () {},
            ),
            InfoboxContentModel(
              subtitle: "Sık Sorulan Sorular",
              onTap: () {},
            ),
            InfoboxContentModel(
              subtitle: "Sipariş",
              onTap: () {},
            ),
          ],
        ),
        _buildHomeInfoBox(
          title: "Alışveriş",
          contents: [
            InfoboxContentModel(
              subtitle: "Mesafeli Satış Sözleşmesi",
              onTap: () {},
            ),
            InfoboxContentModel(
              subtitle: "Gizlilik ve Güvenlik",
              onTap: () {},
            ),
            InfoboxContentModel(
              subtitle: "İptal İade Koşulları",
              onTap: () {},
            ),
            InfoboxContentModel(
              subtitle: "Kişisel Veriler Politikası",
              onTap: () {},
            ),
          ],
        ),
        _buildHomeInfoBox(
          title: "Bilgi",
          contents: [
            InfoboxContentModel(
              subtitle: "Blog",
              onTap: () {},
            ),
            InfoboxContentModel(
              subtitle: "Kargo Takip",
              onTap: () {},
            ),
            InfoboxContentModel(
              subtitle: "İletişim Formu",
              onTap: () {},
            ),
          ],
        ),
        _buildHomeInfoBox(
          title: "Üyelik",
          contents: [
            InfoboxContentModel(
              subtitle: "Yeni Üyelik",
              onTap: () {
                if (FirebaseAuth.instance.currentUser == null) {
                  globalCtx.go(RegisterPage.routeName);
                } else {
                  MessageDialog.twoButtons(
                    backButtonText: "Vazgeç",
                    forwardButtonText: "Onayla",
                    onForwardButtonPressed: () async{
                      await container.read(authManagerProvider).logout();
                      globalCtx.go(RegisterPage.routeName);
                    },
                    purpose: MessageDialogPurpose.warning,
                    caption: "Bilgilendirme",
                    content:
                        "Bu işlemi yapabilmek için önce hesabınızdan çıkış yapmanız gerekmektedir.Çıkış yapmak istediğinize emin misiniz?",
                  );
                }
              },
            ),
            InfoboxContentModel(
              subtitle: "Üye Girişi",
              onTap: () {
                if (FirebaseAuth.instance.currentUser == null) {
                  globalCtx.go(LoginPage.routeName);
                } else {
                  MessageDialog.twoButtons(
                    backButtonText: "Vazgeç",
                    forwardButtonText: "Onayla",
                    onForwardButtonPressed: () async{
                      await container.read(authManagerProvider).logout();
                      globalCtx.go(LoginPage.routeName);
                    },
                    purpose: MessageDialogPurpose.warning,
                    caption: "Bilgilendirme",
                    content:
                        "Bu işlemi yapabilmek için hesabınızdan çıkış yapmanız gerekmektedir.Çıkış yapmak istediğinize emin misiniz?",
                  );
                }
              },
            ),
            InfoboxContentModel(
              subtitle: "Şifremi Unuttum",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHomeInfoBox({
    required String title,
    required List<InfoboxContentModel> contents,
  }) {
    return HomeInfoBox(
      title: title,
      contents: contents,
    );
  }
}
