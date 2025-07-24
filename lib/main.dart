import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
//import 'package:thera_app/pages/bottom_nav_page.dart';
import 'package:thera_app/pages/onboarding/onboarding.dart';
import 'package:thera_app/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: ScreenUtilInit(
        designSize: const Size(402, 874),
        minTextAdapt: true,
        splitScreenMode: true,
        enableScaleText: () => true,
        ensureScreenSize: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'TheraApp',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            home:  OnboardingScreenPage (),
          );
        },
      ),
    );
  }
}
