import 'package:digitaledge/core/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'theme.manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'user/controller.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //Named Constructor

  
  static final MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (context, child) {
        return GetMaterialApp(
          theme: getAppTheme(),
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          initialRoute:UserStore.to.isAuth.value? AppRoutes.homeRoute: AppPages.initial,
        
        );
      },
    );
  }
}
