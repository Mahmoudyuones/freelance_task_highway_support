import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_task_highway_support/core/resources/colors_manager.dart';
import 'package:freelance_task_highway_support/core/resources/font_manager.dart';
import 'package:freelance_task_highway_support/core/resources/style_manager.dart';
import 'package:freelance_task_highway_support/core/widget/default_eleveted_button.dart';
import 'package:freelance_task_highway_support/core/widget/phone_input_field.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  static const String routeName = '/verification';
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late final TextEditingController pinController;
  final TextEditingController phoneController = TextEditingController();
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();

    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 23.w,
      height: 23.h,
      textStyle: TextStyle(fontSize: 10.sp, color: ColorsManager.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.5.r),
        border: Border.all(color: ColorsManager.grey),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: StyleManager().getBoldStyle(color: ColorsManager.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Image.asset(
                'assets/images/Button.png',
                height: 28.h,
                width: 28.w,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 5.h),
              Text(
                'Highway Support',
                style: StyleManager().getBoldStyle(color: ColorsManager.black),
              ),
              SizedBox(height: 2.h),
              Text(
                '24/7 Road Assistance',
                style: StyleManager().getLightStyle(
                  fontSize: FontSize.s10,
                  color: ColorsManager.textColor,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Phone Number'),
                ),
              ),
              PhoneInputField(controller: phoneController),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: DefaultElevatedButton(
                  onPressed: () {},
                  text: "Send Verification Code",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Enter Verification Code'),
                ),
              ),
              Pinput(
                length: 6,
                controller: pinController,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(5.5.r),
                    border: Border.all(color: ColorsManager.grey),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.circular(5.5.r),
                    border: Border.all(color: Colors.blue),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: ColorsManager.red),
                ),
                validator: (value) {
                  return 'pin is incorrect';
                },
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive the code? ",
                      style: StyleManager().getLightStyle(
                        fontSize: FontSize.s10,
                        color: ColorsManager.black,
                      ),
                    ),
                    Text(
                      'Resend it',
                      style: StyleManager().getLightStyle(
                        fontSize: FontSize.s10,
                        color: ColorsManager.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              DefaultElevatedButton(onPressed: () {}, text: "Continue"),
            ],
          ),
        ),
      ),
    );
  }
}
