import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Yeni metin boşsa, işlem yapmadan dön
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Geçersiz karakterleri kaldır (sadece rakamlar ve virgül)
    String filteredText = newValue.text.replaceAll(RegExp(r'[^0-9,]'), '');

    // Virgülün sadece bir kez kullanılmasına izin ver ve virgülden sonra en fazla iki rakam
    if (filteredText.contains(',')) {
      final parts = filteredText.split(',');
      String beforeComma = parts[0];
      String afterComma = parts.length > 1 ? parts[1] : '';

      // Virgülden sonra en fazla iki rakama izin ver
      if (afterComma.length > 2) {
        afterComma = afterComma.substring(0, 2);
      }

      // Virgülden önceki kısma binlik ayracı (nokta) ekle
      beforeComma = _addThousandSeparator(beforeComma);

      filteredText = '$beforeComma,$afterComma';
    } else {
      // Eğer virgül yoksa, tüm metne binlik ayracı ekle
      filteredText = _addThousandSeparator(filteredText);
    }

    // TextEditingValue'yi güncelle ve cursor pozisyonunu koru
    return newValue.copyWith(
      text: filteredText,
      selection: TextSelection.collapsed(offset: filteredText.length),
    );
  }

  String _addThousandSeparator(String value) {
    final parts = value.split('').reversed.toList();
    final result = <String>[];
    for (int i = 0; i < parts.length; i++) {
      if (i > 0 && i % 3 == 0) {
        result.add('.');
      }
      result.add(parts[i]);
    }
    return result.reversed.join('');
  }
}

