import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_task_highway_support/core/resources/colors_manager.dart';
import 'package:freelance_task_highway_support/core/resources/font_manager.dart';
import 'package:freelance_task_highway_support/core/resources/style_manager.dart';
import 'package:freelance_task_highway_support/features/image_picker_functions.dart';

class UploadBox extends StatefulWidget {
  const UploadBox({super.key, required this.label, required this.onTap});
  final String label;
  final void Function(File?) onTap;

  @override
  State<UploadBox> createState() => _UploadBoxState();
}

class _UploadBoxState extends State<UploadBox> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () async {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  contentPadding: const EdgeInsets.all(16),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var temp = await ImagePickerFunctions.gallery();
                          if (temp != null) {
                            imageFile = temp;
                          }
                          setState(() {});
                          Navigator.of(context).pop();
                          widget.onTap(temp);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.image,
                              size: 30,
                              color: ColorsManager.primaryColor,
                            ),
                            const SizedBox(height: 8),
                            const Text('Gallery'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      GestureDetector(
                        onTap: () async {
                          var temp = await ImagePickerFunctions.camera();
                          if (temp != null) {
                            imageFile = temp;
                          }
                          setState(() {});
                          Navigator.of(context).pop();
                          widget.onTap(temp);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: ColorsManager.primaryColor,
                            ),
                            const SizedBox(height: 8),
                            const Text('Camera'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          );
        },
        child: DottedBorder(
          color: ColorsManager.grey,
          strokeWidth: 1,
          dashPattern: [6, 4],
          borderType: BorderType.RRect,

          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.r),

            child:
                imageFile != null
                    ? SizedBox(
                      height: 55.h,
                      width: 130.w,
                      child: Image(
                        image: FileImage(imageFile!),
                        fit: BoxFit.fill,
                      ),
                    )
                    : Column(
                      children: [
                        Icon(
                          Icons.camera_alt_outlined,
                          size: 30.sp,
                          color: Colors.grey,
                        ),

                        Text(
                          widget.label,
                          style: StyleManager().getSemiBoldStyle(
                            fontSize: FontSize.s11,
                            color: ColorsManager.black,
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Text(
                          'PNG, JPG up to 5MB',
                          style: StyleManager().getLightStyle(
                            fontSize: FontSize.s10,
                            color: ColorsManager.textColor,
                          ),
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }
}
