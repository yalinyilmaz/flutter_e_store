import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfoInputField extends StatelessWidget {
  const ProductInfoInputField({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.controller,
    this.inputFormatters,
    this.keyboardType =TextInputType.text
  });

  final String hintText;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        style: const TextStyle(
          color: Color.fromARGB(255, 133, 78, 187),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 133, 78, 187)),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 133, 78, 187),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 133, 78, 187),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 133, 78, 187),
            ),
          ),
        ),
      ),
    );
  }
}
