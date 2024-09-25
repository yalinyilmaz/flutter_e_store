import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';

// ignore: must_be_immutable
class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({super.key, this.onTap, this.isChecked = false});
  bool isChecked;
  Function? onTap;

  @override
  State<CustomCheckbox> createState() =>
      _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap!.call();
      },
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: context.darkColor.shade200,
          border: Border.all(color: context.darkColor.shade500, width: 2),
          borderRadius: BorderRadius.circular(4),
        ),
        child: widget.isChecked
            ? Icon(
                Icons.check,
                color: context.darkColor.shade500,
                size: 18,
                weight: 25,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
