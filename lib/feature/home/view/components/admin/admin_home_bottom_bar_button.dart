import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';

class AdminHomeBottomBarButton extends StatelessWidget {
  AdminHomeBottomBarButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.isActive});

  String title;
  Widget icon;
  Function onTap;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeButton(
      onTap: () {
        onTap.call();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: isActive ? globalCtx.whiteColor.shade500 : null,
            height: 3,
            width: MediaQuery.sizeOf(context).width * .20,
          ),
          icon,
          Text(
            title,
            style: context.textTheme.subheadlineEmphasized.copyWith(
                color: isActive
                    ? globalCtx.whiteColor.shade500
                    : globalCtx.darkColor.shade500),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
