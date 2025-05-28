import 'package:flutter/material.dart';

class AppTextFiled extends StatelessWidget {
  const AppTextFiled({
    super.key,
    this.keyboardType,
    this.autocorrect = false,
    this.hintText,
    this.controller,
    this.width,
  });

  final TextInputType? keyboardType;

  final bool autocorrect;

  final String? hintText;

  final TextEditingController? controller;

  final double? width;

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    autocorrect: autocorrect,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintText,
      isDense: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}
