import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/auth/view/components/admin_auth_card.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});
  static const routeName = '/auth/admin_login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(color: context.whiteColor.shade600),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Assets.images.mainLogo.image(scale: 1.7),
                const SizedBox(height: 20),
                AdminAuthCard(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
