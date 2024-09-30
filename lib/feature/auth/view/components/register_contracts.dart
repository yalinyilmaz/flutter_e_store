import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/components/custom_checkbox/custom_checkbox.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';

class Conracts extends StatelessWidget {
   const Conracts({
    super.key,
    this.initialValue = false,
  });

  final bool initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildContract(
            text:
                "Aydınlatma Metninde belirtilen ilkeler nezdinde Elektronik Ticaret İletisi almak istiyorum"),
        const SizedBox(height: 10),
        _buildContract(text: "Üyelik sözleşmesini kabul ediyorum."),
        const SizedBox(height: 10),
        _buildContract(
            text:
                "Kişisel verilerin işlenmesine ilişkin Aydınlatma Metnini okudum."),
      ],
    );
  }

  Widget _buildContract({required String text}) {
    final isChecked = ValueNotifier<bool>(initialValue);
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: isChecked,
            builder: (context, e, r) {
              return CustomCheckbox(
                isChecked: isChecked.value,
                onTap: () {
                  isChecked.value = !isChecked.value;
                },
              );
            }),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            text,
            style: globalCtx.textTheme.caption1Regular,
          ),
        )
      ],
    );
  }
}
