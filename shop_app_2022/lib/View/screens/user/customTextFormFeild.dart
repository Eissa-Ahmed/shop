import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  // CustomTextFormFeild(
  //   Key? key,
  //   this.hint,
  //   this.onSaved,
  //   this.prefixIcon,
  //   this.validator, [
  //   this.suffixIcon,
  // ]) : super(key: key);

  CustomTextFormFeild({
    required this.hint,
    required this.onSaved,
    required this.prefixIcon,
    required this.validator,
    required this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.onChanged,
  });

  String? Function(String? val)? validator;
  void Function(String? val)? onSaved;
  void Function(String)? onChanged;
  Widget? prefixIcon;
  Widget? suffixIcon;
  String hint;
  bool? obscureText;
  TextInputType? keyboardType;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
