import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_task_highway_support/core/resources/colors_manager.dart';
import 'package:freelance_task_highway_support/core/resources/style_manager.dart';

class CustomDropDownBottom extends StatefulWidget {
  const CustomDropDownBottom({
    super.key,
    required this.list,
    required this.hintText,
    required this.onTap,
  });
  final List<String> list;
  final String hintText;
  final Function onTap;
  @override
  State<CustomDropDownBottom> createState() => _CustomDropDownBottomState();
}

class _CustomDropDownBottomState extends State<CustomDropDownBottom> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: ColorsManager.grey),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(4.r),
          dropdownColor: ColorsManager.white,
          isExpanded: true,
          hint: Text(widget.hintText),
          value: selectedItem,
          icon: const Icon(Icons.keyboard_arrow_down),
          items:
              widget.list.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: StyleManager().getLightStyle(
                      color: ColorsManager.black,
                    ),
                  ),
                );
              }).toList(),
          onChanged: (value) {
            setState(() {
              selectedItem = value;
              widget.onTap(value);
            });
          },
        ),
      ),
    );
  }
}
