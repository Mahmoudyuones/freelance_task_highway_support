import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key, required this.onGenderSelected});
  final Function onGenderSelected;
  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender*', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4.h),
        Row(
          children: [
            _buildGenderOption('Male', Icons.male),
            SizedBox(width: 5.w),
            _buildGenderOption('Female', Icons.female),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderOption(String gender, IconData icon) {
    final isSelected = selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = gender;
            widget.onGenderSelected(selectedGender);
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade50 : Colors.transparent,
            border: Border.all(color: isSelected ? Colors.blue : Colors.grey),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                gender,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 3.w),
              Icon(
                icon,
                size: 10.sp,
                color: isSelected ? Colors.blue : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
