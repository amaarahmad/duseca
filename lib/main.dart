
import 'package:duseca_task/const/colors.dart';
import 'package:duseca_task/view/driver_info_view.dart';
import 'package:duseca_task/view/pick_ride_view.dart';
import 'package:duseca_task/view/ride_history_view.dart';
import 'package:duseca_task/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context,orientation, deviceType){
      return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          fontFamily: 'montserrat',
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        home:  SignUpView(),
      );
    });
  }
}
