import 'package:form_field_validator/form_field_validator.dart';

class TRPhoneValidator extends TextFieldValidator {
  // pass the error text to the super constructor
  TRPhoneValidator({String errorText = 'Geçerli bir telefon numarası giriniz'})
      : super(errorText);

  // return false if you want the validator to return error
  // message when the value is empty.
  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String? value) {
    return hasMatch(r'(05|5)[0-9][0-9][0-9]([0-9]){6}', normalizeValue(value));
  }

  String normalizeValue(String? value) {
    var tmpValue = value ?? '';
    tmpValue = tmpValue.replaceAll('(', '');
    tmpValue = tmpValue.replaceAll(')', '');
    tmpValue = tmpValue.replaceAll(' ', '');
    return tmpValue;
  }
}

