import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
class NewCustomDropdownButton extends StatefulWidget {
  const NewCustomDropdownButton({
    super.key,
  });

  static const List<String> currencySymbols = ["€", "₺", "\$"];

  @override
  State<NewCustomDropdownButton> createState() =>
      _NewCustomDropdownButtonState();
}

class _NewCustomDropdownButtonState extends State<NewCustomDropdownButton> {
  List<DropdownMenuItem<String>> currencyItems =
      NewCustomDropdownButton.currencySymbols.map((symbol) {
    return DropdownMenuItem<String>(
      value: symbol,
      enabled: true,
      child: Center(
        child: Text(
          symbol,
          style: globalCtx.textTheme.title1Regular.copyWith(
            color: globalCtx.whiteColor.shade50,
          ),
        ),
      ),
    );
  }).toList();

  String? selectedSymbol;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: const SizedBox.shrink(),
      borderRadius: BorderRadius.circular(8),
      icon: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: context.darkColor.shade500.withOpacity(.25),
                blurRadius: 3.63,
                offset: const Offset(1, 3.63),
              ),
            ],
            borderRadius: BorderRadius.circular(8),
            color: context.darkColor.shade500),
        child: Center(
          child: Text(
            selectedSymbol ?? "₺",
            style: context.textTheme.title1Regular
                .copyWith(color: globalCtx.whiteColor.shade50),
          ),
        ),
      ),
      dropdownColor: context.darkColor.shade500,
      menuWidth: 80,
      items: currencyItems,
      onChanged: (value) {
        setState(() {
          if (value != null) {
            selectedSymbol = value;
          }
        });
      },
    );
  }
}
