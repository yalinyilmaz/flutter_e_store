import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/feature/auth/view/components/register_card.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static const routeName = '/auth/register_page';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
                  RegisterCard(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
