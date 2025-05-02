import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_task_highway_support/core/resources/colors_manager.dart';
import 'package:freelance_task_highway_support/core/resources/font_manager.dart';
import 'package:freelance_task_highway_support/core/resources/style_manager.dart';
import 'package:freelance_task_highway_support/core/utils/validator.dart';
import 'package:freelance_task_highway_support/core/widget/default_eleveted_button.dart';
import 'package:freelance_task_highway_support/core/widget/default_text_form_field.dart';
import 'package:freelance_task_highway_support/core/widget/uoload_box.dart';

class IdentityDocumentsScreen extends StatefulWidget {
  static const String routeName = '/identity_documents';
  const IdentityDocumentsScreen({super.key});

  @override
  State<IdentityDocumentsScreen> createState() =>
      _IdentityDocumentsScreenState();
}

class _IdentityDocumentsScreenState extends State<IdentityDocumentsScreen> {
  TextEditingController idNumberController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  File? frontIDImageFile;
  File? backIDImageFile;
  File? frontLicenseImageFile;
  File? backLicenseImageFile;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: StyleManager().getBoldStyle(color: ColorsManager.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.h),
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Help",
                style: StyleManager().getLightStyle(
                  fontSize: 7.sp,
                  color: ColorsManager.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: ColorsManager.lightBlue,
                  ),
                  width: 47.w,
                  height: 47.h,
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(2.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.r),
                      color: ColorsManager.primaryColor,
                    ),
                    child: Image.asset(
                      'assets/images/Vector.png',
                      color: ColorsManager.white,
                      height: 12.5.h,
                      width: 19.5.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Identity Documents',
                  style: StyleManager().getLightStyle(
                    color: ColorsManager.black,
                  ),
                ),
                Text('Verify your identity with official documents'),
                SizedBox(height: 6.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: const Text(
                    'ID Card Number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 2.h),
                DefaultTextFormField(
                  hintText: "Enter ID Number ",
                  label: 'ID card Number',
                  controller: idNumberController,
                  suffixIcon: Icons.help_outline,
                  validator: (value) {
                    return Validators.isValidIDCardNumber(value);
                  },
                ),
                SizedBox(height: 2.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: const Text('Enter your government-issued ID number'),
                ),
                SizedBox(height: 4.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'ID Card Images*',
                    style: TextStyle(
                      fontSize: FontSize.s11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                UploadBox(
                  label: "Upload front of ID Card",
                  onTap: (File? file) {
                    frontIDImageFile = file;

                    setState(() {});
                  },
                ),
                UploadBox(
                  label: "Upload back of ID Card",
                  onTap: (File? file) {
                    backIDImageFile = file;

                    setState(() {});
                  },
                ),
                SizedBox(height: 5.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: const Text(
                    'Driver\'s License',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 2.h),
                DefaultTextFormField(
                  hintText: "Enter License Number ",
                  label: 'Driver\'s License Number',
                  controller: licenseNumberController,
                  suffixIcon: Icons.help_outline,
                  validator: (value) {
                    return Validators.isValidLicenseNumber(value);
                  },
                ),
                SizedBox(height: 2.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: const Text('Enter your government-License number'),
                ),
                SizedBox(height: 4.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Driver\'s License Images*',
                    style: TextStyle(
                      fontSize: FontSize.s11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                UploadBox(
                  label: "Upload front of License",
                  onTap: (File? file) {
                    frontLicenseImageFile = file;
                    setState(() {});
                  },
                ),
                UploadBox(
                  label: "Upload back of License",
                  onTap: (File? file) {
                    backLicenseImageFile = file;
                    setState(() {});
                  },
                ),
                SizedBox(height: 5.h),
                DefaultElevatedButton(
                  onPressed: () {
                    bool isFormValid = formKey.currentState!.validate();
                    bool areImagesProvided =
                        frontIDImageFile != null &&
                        backIDImageFile != null &&
                        frontLicenseImageFile != null &&
                        backLicenseImageFile != null;

                    if (isFormValid && areImagesProvided) {
                      print('Form submitted successfully');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Complete Your profile'),
                          backgroundColor: ColorsManager.red,
                          duration: Duration(seconds: 1),
                        ),
                      );
                    }
                  },
                  text: "Continue",
                ),
                SizedBox(height: 5.h),
                DefaultElevatedButton(
                  onPressed: () {},
                  text: "Skip for now",
                  backGroundColor: ColorsManager.backGroundColor,
                  textColor: ColorsManager.primaryColor,
                ),

                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: StyleManager().getLightStyle(
                          fontSize: FontSize.s10,
                          color: ColorsManager.black,
                        ),
                      ),
                      Text(
                        'Login',
                        style: StyleManager().getLightStyle(
                          fontSize: FontSize.s10,
                          color: ColorsManager.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 3.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: ColorsManager.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4.r),
                          topLeft: Radius.circular(4.r),
                        ),
                      ),
                    ),
                    Container(
                      height: 3.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: ColorsManager.grey,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(4.r),
                          topRight: Radius.circular(4.r),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Step 2 of 3',
                        style: StyleManager().getBoldStyle(
                          color: ColorsManager.primaryColor,
                          fontSize: FontSize.s10,
                        ),
                      ),
                      Text(
                        'Identity Verification',
                        style: StyleManager().getBoldStyle(
                          color: ColorsManager.textColor,
                          fontSize: FontSize.s9,
                        ),
                      ),
                    ],
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
