// ignore_for_file: unrelated_type_equality_checks

import 'package:duseca_task/const/colors.dart';
import 'package:duseca_task/const/widgets/my_button.dart';
import 'package:duseca_task/const/widgets/my_text.dart';
import 'package:duseca_task/controller/driver_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
class ChartWidget extends StatelessWidget {
  String title;
  ChartWidget({super.key,required this.title});

  final _controller=Get.put(DriverInfoTabController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Obx(() =>Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myText(text: title,size: 20.sp,fontWeight: FontWeight.bold,color: black.withOpacity(0.5)),
              const Spacer(),
              IconButton(onPressed: (){
                _controller.changeOpen();
              }, icon: Icon(_controller.isOpen.value?Icons.arrow_drop_up:Icons.arrow_drop_down,color: primaryColor,)),
              myText(text: "This week",color: primaryColor,fontWeight: FontWeight.bold)
            ],
          ),
          2.height,


          _controller.isOpen.value?Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              myGraph(15, 'Sat'),
              myGraph(10, 'Sun'),
              myGraph(20, 'Mon'),
              myGraph(17, 'Tue'),
              myGraph(22, 'Wed'),
              myGraph(16, 'Thu'),
              myGraph(7, 'Fri'),

            ],
          ):const SizedBox(),
          4.height,
          _controller.selectedIndex==0?Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myText(text: '200.60.00 zt',size: 20.sp,fontWeight: FontWeight.bold),
              customButton(width: 30.w, text: "Withdraw")
            ],
          ):const SizedBox(),
          4.height,

          Divider(

            thickness: 1,
            height: 2.sp,
          )
        ],
      )),
    );
  }
}
myGraph(double height,String day){
  return Column(
    children: [
      Container(
        height: height.h,
        width: 5.w,

        decoration: const BoxDecoration(
            color: primaryColor,
            gradient: LinearGradient(colors: [primaryColor,white],begin: Alignment.topCenter,end: Alignment.bottomCenter),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )
        ),
      ).animate().fade(duration:const Duration(seconds: 1)).slideY(),
      2.height,
      myText(text: day,size: 10.sp,fontWeight: FontWeight.bold,color: black.withOpacity(0.5))
    ],
  );
}