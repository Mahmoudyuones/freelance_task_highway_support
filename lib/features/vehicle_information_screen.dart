import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_task_highway_support/core/resources/colors_manager.dart';
import 'package:freelance_task_highway_support/core/resources/font_manager.dart';
import 'package:freelance_task_highway_support/core/resources/style_manager.dart';
import 'package:freelance_task_highway_support/core/utils/validator.dart';
import 'package:freelance_task_highway_support/core/widget/custom_drop_down_bottom.dart';
import 'package:freelance_task_highway_support/core/widget/default_eleveted_button.dart';
import 'package:freelance_task_highway_support/core/widget/default_text_form_field.dart';

class VehicleInformationScreen extends StatefulWidget {
  static const String routeName = '/vehicleInformationScreen';
  const VehicleInformationScreen({super.key});

  @override
  State<VehicleInformationScreen> createState() =>
      _VehicleInformationScreenState();
}

class _VehicleInformationScreenState extends State<VehicleInformationScreen> {
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController vehicleYearController = TextEditingController();
  String? vehicleType;
  var formKey = GlobalKey<FormState>();
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
          padding: EdgeInsets.symmetric(horizontal: 5.h),
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
                  'Vehicle Information',
                  style: StyleManager().getLightStyle(
                    color: ColorsManager.black,
                  ),
                ),
                Text('Enter your vehicle details'),
                SizedBox(height: 6.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'License Plate Number',
                    style: TextStyle(
                      fontSize: FontSize.s11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                DefaultTextFormField(
                  hintText: "Enter Plate Number ",
                  label: 'License Plate Number',
                  controller: vehicleNumberController,

                  validator: (value) {
                    return Validators.validateVehicleNumber(value);
                  },
                ),
                SizedBox(height: 4.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Vehicle Type',
                    style: TextStyle(
                      fontSize: FontSize.s11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),

                CustomDropDownBottom(
                  list: ["Car", "Motorcycle", "Taxi"],
                  hintText: "Select vehicle type",
                  onTap: (String selectedType) {
                    vehicleType = selectedType;
                  },
                ),
                SizedBox(height: 4.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'Vehicle Year',
                    style: TextStyle(
                      fontSize: FontSize.s11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                DefaultTextFormField(
                  hintText: "Enter vehicle year",
                  label: "vehicle year",
                  controller: vehicleYearController,
                  validator: (value) {
                    return Validators.validateYear(value);
                  },
                ),
                SizedBox(height: 5.h),
                DefaultElevatedButton(
                  onPressed: () {
                    bool isFormValid = formKey.currentState!.validate();

                    if (isFormValid && vehicleType != null) {
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
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: ColorsManager.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(4.r)),
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
                        'Step 3 of 3',
                        style: StyleManager().getBoldStyle(
                          color: ColorsManager.primaryColor,
                          fontSize: FontSize.s10,
                        ),
                      ),
                      Text(
                        'Vehicle Info',
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
