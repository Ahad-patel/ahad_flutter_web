import 'dart:ui_web';

import 'package:ahad_ayna_interview_project/core/routes/route_utils.dart';
import 'package:ahad_ayna_interview_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'core/config/shim_db.dart';

void main() async {
  usePathUrlStrategy();
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
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: RouteUtils().goRouter,
      ),
    );
  }
}
