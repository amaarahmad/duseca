import 'package:duseca_task/const/app_assets.dart';
import 'package:duseca_task/const/colors.dart';
import 'package:duseca_task/const/widgets/my_button.dart';
import 'package:duseca_task/const/widgets/my_text.dart';
import 'package:duseca_task/view/driver_info_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
class RideHistoryView extends StatefulWidget {
  const RideHistoryView({super.key});

  @override
  State<RideHistoryView> createState() => _RideHistoryViewState();
}

class _RideHistoryViewState extends State<RideHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          4.height,
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
                    boxShadow: [
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
                      )                  ]
                  ),
                  child: const Center(
                    child: Icon(Icons.arrow_back_ios_new,color: primaryColor,),
                  ),
                ),
              ),
              20.width,
              myText(text: 'Ride History',size: 20.sp,fontWeight: FontWeight.w700),


            ],
          ),
          3.height,
          Expanded(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context,index){
              return Container(
                height: 21.h,
                width: 85.w,
                margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 1,
                        color: black.withOpacity(0.1)
                    )
                ),
                child: Row(
                  children: [
                    Container(
                      height: 19.h,
                      width: 52.w,
                      margin: EdgeInsets.only(left: 7.sp),
                      child: Stack(
                        children: [
                          Container(
                            height: 18.h,
                            width: 25.w,
                            decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15)
                            ),
                          ),
                          Positioned(
                              left: 0,
                              bottom: 0,
                              child: Image.asset(AppAssets.vagun,width: 35.w,)).animate().fadeIn(duration: const Duration(seconds: 2)).scaleXY(),
                          Positioned(
                              right: 0,
                              child: SizedBox(
                                height: 11.h,
                                width: 40.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    4.width,
                                    Column(
                                      children: [
                                        1.height,
                                        CircleAvatar(
                                          radius: 4.sp,
                                          backgroundColor: Colors.green,
                                        ),
                                        0.5.height,
                                        Container(
                                          height: 5.5.h,
                                          width: 0.5.w,
                                          color: black,
                                        ),
                                        Icon(Icons.arrow_drop_down,color: primaryColor,size: 15.sp,)
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        1.height,
                                        myText(text: 'Gorzow',size: 9.sp),
                                        5.height,
                                        myText(text: 'Berlin Airport',size: 9.sp),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 19.h,
                      width: 33.w,
                      //color: availableColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          myText(text: '\$ 45.99',size: 20.sp,fontWeight: FontWeight.bold),
                          1.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Image.asset(AppAssets.eventIcon),
                              1.width,
                              myText(text: 'Germany',color: black.withOpacity(0.5),size: 10.sp,fontWeight: FontWeight.bold)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),

          ),
          customButton(width: 30.w, text: 'Next',onTap: (){
            Get.to(const DriverInfoView());
          }),
          2.height,

        ],
      )),
    );
  }
}
