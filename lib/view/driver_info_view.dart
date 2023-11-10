import 'package:duseca_task/const/colors.dart';
import 'package:duseca_task/const/widgets/my_text.dart';
import 'package:duseca_task/const/widgets/tab_widget.dart';
import 'package:duseca_task/controller/driver_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
class DriverInfoView extends StatefulWidget {
  const DriverInfoView({super.key});

  @override
  State<DriverInfoView> createState() => _DriverInfoViewState();
}

class _DriverInfoViewState extends State<DriverInfoView> {
  final controller=Get.put(DriverInfoTabController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Column(
        children: [
          3.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(

                  height: 5.h,
                  width: 10.w,
                  margin: EdgeInsets.only(left: 20.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: white,
                      boxShadow:  [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(4, 4),
                            blurRadius: 15,
                            spreadRadius: 1
                        ),
                        const BoxShadow(
                            color: Colors.white,
                            offset: Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1
                        )                    ]
                  ),
                  child: const Center(
                    child: Icon(Icons.arrow_back_ios_new,color: primaryColor,),
                  ),
                ),
              ),
              20.width,
              myText(text: 'Driver Info',size: 20.sp,fontWeight: FontWeight.w700),


            ],
          ),
          3.height,


          Container(
            height: 7.h,
            color: primaryColor.withOpacity(0.1),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(controller.labels.length, (index) => Obx(() => TabButtonComponent(
                    controller.labels[index], () =>controller.selectedIndex(index),
                    isSelected: index==controller.selectedIndex.value
                ))),
              ),
            ),
          ),
          3.height,
          Obx(() =>controller.contentScreen[controller.selectedIndex.value])



        ],
      )),
    );
  }
}
