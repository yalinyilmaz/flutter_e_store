import 'package:flutter/material.dart';
import 'package:flutter_e_store/feature/home/model/infobox_content_model.dart';
import 'package:flutter_e_store/feature/home/view/components/home_info_box.dart';

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
              onTap: () {},
            ),
            InfoboxContentModel(
              subtitle: "Üye Girişi",
              onTap: () {},
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
