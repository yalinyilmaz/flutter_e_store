import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';

// ignore: must_be_immutable
class CustomCheckbox extends StatefulWidget {
  CustomCheckbox(
      {super.key, this.onTap, this.isChecked = false, this.size = 24.0});
  bool isChecked;
  Function? onTap;
  final double size;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.whiteColor.shade100,
          border: Border.all(color: context.greyColor.shade500, width: .5),
        ),
        child: widget.isChecked
            ? Icon(
                Icons.check,
                color: const Color.fromARGB(255, 133, 78, 187),
                size: widget.size * 0.75,
                weight: 25,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
