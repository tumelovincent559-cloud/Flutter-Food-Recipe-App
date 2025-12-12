import 'package:flutter/material.dart';
import '../theme/color.dart';

class CustomRoundTextBox extends StatelessWidget {
  const CustomRoundTextBox({
    super.key,
    this.hint = "",
    this.prefix,
    this.suffix,
    this.controller,
    this.readOnly = false,
    this.boxShadow,
    this.contentPadding,
  });

  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool readOnly;
  final BoxShadow? boxShadow;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    // Use the provided boxShadow if available, otherwise create a default one
    final BoxShadow effectiveBoxShadow = boxShadow ??
        BoxShadow(
          // ✅ use withValues instead of deprecated withOpacity
          color: shadowColor.withValues(alpha: 0.5),
          spreadRadius: 1,
          blurRadius: 1,
          offset: const Offset(0, 1), // changes position of shadow
        );

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 3),
      height: 40,
      decoration: BoxDecoration(
        color: textBoxColor,
        border: Border.all(color: textBoxColor),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [effectiveBoxShadow],
      ),
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: contentPadding,
          prefixIcon: prefix,
          suffixIcon: suffix,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
