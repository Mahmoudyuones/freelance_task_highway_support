import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_task_highway_support/core/resources/colors_manager.dart';

class DefaultTextFormField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final IconData? suffixIcon;
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const DefaultTextFormField({
    super.key,
    required this.hintText,
    this.icon,
    required this.label,
    this.validator,
    required this.controller,
    this.suffixIcon,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: ColorsManager.textColor),
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: Icon(widget.suffixIcon, color: ColorsManager.textColor),
        ),
        prefixIcon:
            widget.icon == null
                ? null
                : Icon(widget.icon, color: ColorsManager.textColor),
        filled: true,
        fillColor: ColorsManager.white,
        hintStyle: TextStyle(color: ColorsManager.textColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4.r)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: ColorsManager.textColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: ColorsManager.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: ColorsManager.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(color: ColorsManager.red),
        ),
      ),
    );
  }
}
