import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/home/manager/admin_home_manager.dart';
import 'package:flutter_e_store/feature/home/view/components/admin/admin_home_bottom_bar.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});
  static const routeName = "/admin_home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Fexx Yönetim Paneli",
            style: globalCtx.textTheme.title3Emphasized
                .copyWith(color: globalCtx.whiteColor.shade100),
          ),
          leading: const SizedBox(),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 133, 78, 187),
        ),
        body: ValueListenableBuilder(
            valueListenable: selectedHomeFragments,
            builder: (context, w, _) {
              return selectedHomeFragMap[selectedHomeFragments.value]!;
            }),
        bottomNavigationBar: const AdminHomeBottomBar());
  }
}
