import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/home/manager/admin_home_manager.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_home_bottom_bar_button.dart';

class AdminHomeBottomBar extends StatelessWidget {
  const AdminHomeBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedHomeFragments,
        builder: (context, a, b) {
          return Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.1),
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 133, 78, 187)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomBarBtn(
                    title: "Ürünler",
                    fragment: AdminHomeFragments.productList,
                    icon: Icons.feed),
                _buildBottomBarBtn(
                    title: "Ürün Ekle",
                    fragment: AdminHomeFragments.addProduct,
                    icon: Icons.post_add),
                _buildBottomBarBtn(
                    title: "Profil",
                    fragment: AdminHomeFragments.profile,
                    icon: Icons.person),
              ],
            ),
          );
        });
  }

  AdminHomeBottomBarButton _buildBottomBarBtn(
      {required AdminHomeFragments fragment,
      required String title,
      required IconData icon}) {
    return AdminHomeBottomBarButton(
      isActive: selectedHomeFragments.value == fragment,
      title: title,
      icon: Icon(
        icon,
        color: selectedHomeFragments.value == fragment
            ? globalCtx.whiteColor.shade100
            : globalCtx.darkColor.shade800,
      ),
      onTap: () {
        selectedHomeFragments.value = fragment;
      },
    );
  }
}
