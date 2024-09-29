import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';

class NewCustomDropdownButton extends StatefulWidget {
  const NewCustomDropdownButton(
      {super.key,
      this.customColor,
      this.customBorderColor,
      this.icon,
      required this.items,
      required this.initialValue,
      this.width,
      this.height,
      this.textStyle,
      this.menuWidth,
      this.onChanged
      });

  final void Function(String)? onChanged;
  final List<String> items;
  final Color? customColor;
  final Color? customBorderColor;
  final Widget? icon;
  final String initialValue;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final double? menuWidth;

  @override
  State<NewCustomDropdownButton> createState() =>
      _NewCustomDropdownButtonState();
}

class _NewCustomDropdownButtonState extends State<NewCustomDropdownButton> {
  late List<DropdownMenuItem<String>> itemList;

  @override
  void initState() {
    itemList = widget.items.map((value) {
      return DropdownMenuItem<String>(
        value: value,
        enabled: true,
        child: Center(
          child: Text(
            value,
            style: globalCtx.textTheme.title1Regular.copyWith(
              color: globalCtx.whiteColor.shade50,
            ),
          ),
        ),
      );
    }).toList();
    super.initState();
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: const SizedBox.shrink(),
      borderRadius: BorderRadius.circular(8),
      icon: Container(
        height: widget.height ?? 45,
        width: widget.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: context.darkColor.shade500.withOpacity(.25),
                blurRadius: 3.63,
                offset: const Offset(1, 3.63),
              ),
            ],
            border: widget.customBorderColor != null
                ? Border.all(color: widget.customBorderColor!)
                : null,
            borderRadius: BorderRadius.circular(8),
            color: widget.customColor ?? const Color(0xff0CDAE4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue ?? widget.initialValue,
                style: widget.textStyle ??
                    context.textTheme.title1Regular
                        .copyWith(color: globalCtx.whiteColor.shade50),
              ),
              widget.icon ?? const SizedBox.shrink()
            ],
          ),
        ),
      ),
      dropdownColor: widget.customColor ?? const Color(0xff0CDAE4),
      menuMaxHeight: 300,
      menuWidth: widget.menuWidth ?? 80,
      items: itemList,
      onChanged: (value) {
        setState(() {
          if (value != null) {
            selectedValue = value;
            widget.onChanged?.call(value);
          }
        });
      },
    );
  }
}
