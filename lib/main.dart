import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freelance_task_highway_support/core/resources/app_theme.dart';
import 'package:freelance_task_highway_support/features/personal_information.dart';
import 'package:freelance_task_highway_support/features/verfiication_screen.dart';

void main() {
  runApp(const HighwaySupport());
}

class HighwaySupport extends StatelessWidget {
  const HighwaySupport({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(172, 377),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
          (_, __) => MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              VerificationScreen.routeName: (_) => VerificationScreen(),
              PersonalInformation.routeName: (_) => PersonalInformation(),
            },
            initialRoute: PersonalInformation.routeName,
            theme: AppTheme.lightThem,
            themeMode: ThemeMode.light,
          ),
    );
  }
}
