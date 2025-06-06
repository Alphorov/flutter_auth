import 'package:flutter/material.dart';

class AppTextFiled extends StatelessWidget {
  const AppTextFiled({
    super.key,
    this.keyboardType,
    this.errorText,
    this.hintText,
    this.controller,
    this.width,
    this.hasError = false,
    this.autocorrect = false,
    this.obscureText = false,
  });

  final TextInputType? keyboardType;

  final bool autocorrect;

  final String? hintText;

  final TextEditingController? controller;

  final double? width;

  final String? errorText;

  final bool hasError;

  final bool obscureText;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    autocorrect: autocorrect,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      errorText: errorText,
      hintText: hintText,
      isDense: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      enabledBorder:
          hasError
              ? OutlineInputBorder(
                borderSide: BorderSide(color: ColorScheme.of(context).error),
                borderRadius: BorderRadius.circular(8),
              )
              : null,
      focusedBorder:
          hasError
              ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorScheme.of(context).error,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(8),
              )
              : null,
    ),
  );
}
