import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_task_highway_support/core/resources/colors_manager.dart';
import 'package:freelance_task_highway_support/core/resources/font_manager.dart';
import 'package:freelance_task_highway_support/core/resources/style_manager.dart';
import 'package:freelance_task_highway_support/core/widget/default_eleveted_button.dart';
import 'package:freelance_task_highway_support/core/widget/default_text_form_field.dart';
import 'package:freelance_task_highway_support/core/widget/gender_selector.dart';

class PersonalInformation extends StatefulWidget {
  static const String routeName = '/Personal_information';
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
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
      body: Padding(
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
                child: Icon(
                  Icons.person_2,
                  size: 20.sp,
                  color: ColorsManager.primaryColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Personal Information',
                style: StyleManager().getLightStyle(color: ColorsManager.black),
              ),
              Text('Please enter your details below'),
              SizedBox(height: 6.h),
              GenderSelector(),
              SizedBox(height: 6.h),

              Align(
                alignment: AlignmentDirectional.centerStart,
                child: const Text(
                  'UserName*',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 2.h),
              DefaultTextFormField(
                hintText: 'Enter UserName',
                label: "User Name",
                isPassword: false,
                controller: userNameController,
                validator: (value) {
                  // write validate logic
                  return null;
                },
              ),
              SizedBox(height: 6.h),

              Align(
                alignment: AlignmentDirectional.centerStart,
                child: const Text(
                  'First Name*',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 2.h),
              DefaultTextFormField(
                hintText: 'Enter First Name',
                label: "First Name",
                isPassword: false,
                controller: userNameController,
                validator: (value) {
                  // write validate logic
                  return null;
                },
              ),
              SizedBox(height: 6.h),

              Align(
                alignment: AlignmentDirectional.centerStart,
                child: const Text(
                  'Middle Name*',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 2.h),
              DefaultTextFormField(
                hintText: 'Enter Middle Name',
                label: "Middle Name",
                isPassword: false,
                controller: userNameController,
                validator: (value) {
                  // write validate logic
                  return null;
                },
              ),
              SizedBox(height: 6.h),

              Align(
                alignment: AlignmentDirectional.centerStart,
                child: const Text(
                  'Last Name*',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 2.h),
              DefaultTextFormField(
                hintText: 'Enter Last Name',
                label: "Last Name",
                isPassword: false,
                controller: userNameController,
                validator: (value) {
                  // write validate logic
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              DefaultElevatedButton(onPressed: () {}, text: "Continue"),
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
                    width: 50.w,
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
                    width: 100.w,
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
                      'Step 1 of 3',
                      style: StyleManager().getBoldStyle(
                        color: ColorsManager.primaryColor,
                        fontSize: FontSize.s10,
                      ),
                    ),
                    Text(
                      'Basic Info',
                      style: StyleManager().getBoldStyle(
                        color: ColorsManager.textColor,
                        fontSize: FontSize.s10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
