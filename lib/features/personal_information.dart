import 'package:flutter/material.dart';
import 'package:freelance_task_highway_support/core/resources/colors_manager.dart';
import 'package:freelance_task_highway_support/core/resources/style_manager.dart';

class PersonalInformation extends StatelessWidget {
  static const String routeName = '/Personal_information';
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: StyleManager().getBoldStyle(color: ColorsManager.black),
        ),
        actions: [Text("help")],
      ),
    );
  }
}
