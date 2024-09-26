import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/core/button_animation/new_animated_fade_button.dart';
import 'package:flutter_e_store/feature/home/model/infobox_content_model.dart';

class HomeInfoBox extends StatelessWidget {
  HomeInfoBox({super.key, required this.title, required this.contents});

  final String title;
  final List<InfoboxContentModel> contents;
  final expanded = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: expanded,
        builder: (context, r, _) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedFadeButton(
                  onTap: () {
                    expanded.value = !expanded.value;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.whiteColor.shade100,
                      border: Border.all(color: context.greyColor.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: context.textTheme.headlineRegular,
                          ),
                          Icon(
                            expanded.value ? Icons.remove : Icons.add,
                            weight: 15,
                            color: context.darkColor.shade900,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                expanded.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _generateContent(),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          );
        });
  }

  List<Widget> _generateContent() {
    List<Widget> buttons = [const SizedBox(height: 10)];
    for (var content in contents) {
      buttons.add(AnimatedFadeButton(
        onTap: content.onTap,
        child: Text(
          content.subtitle,
          style: globalCtx.textTheme.subheadlineEmphasized,
        ),
      ));
      buttons.add(const SizedBox(
        height: 10,
      ));
    }
    return buttons;
  }
}
