import 'package:flutter/services.dart';

class TRPhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    // Remove any spaces from the input
    newText = newText.replaceAll(' ', '');

    // Apply the desired formatting
    if (newText.length > 3) {
      newText = newText.substring(0, 3) + ' ' + newText.substring(3);
    }
    if (newText.length > 7) {
      newText = newText.substring(0, 7) + ' ' + newText.substring(7);
    }
    if (newText.length > 11) {
      newText = newText.substring(0, 11) + ' ' + newText.substring(11);
    }
    if (newText.length > 14) {
      newText = newText.substring(0, 14) + ' ' + newText.substring(14);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
