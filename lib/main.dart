import 'dart:ui_web';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahad_ayna_interview_project/core/config/hive_db.dart';
import 'package:ahad_ayna_interview_project/core/routes/route_utils.dart';
import 'package:ahad_ayna_interview_project/core/user/user.dart';
import 'package:ahad_ayna_interview_project/core/utils/app_theme.dart';
import 'package:ahad_ayna_interview_project/service_locator.dart';
// import 'package:ahad_ayna_interview_project_plugins/url_strategy.dart';

void main() async {
  urlStrategy!;
  // setPathUrlStrategy();
  setupLocator();
  await AppLocalDB.init();
  // User().isLoggedIn;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      child: MaterialApp.router(
        title: 'Flutter web socket',
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.theme,
        routerConfig: RouteUtils().goRouter,
      ),
    );
  }
}
