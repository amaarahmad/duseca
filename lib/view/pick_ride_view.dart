import 'package:duseca_task/const/app_assets.dart';
import 'package:duseca_task/const/colors.dart';
import 'package:duseca_task/const/widgets/my_button.dart';
import 'package:duseca_task/const/widgets/my_text.dart';
import 'package:duseca_task/controller/pic_ride_controller.dart';
import 'package:duseca_task/view/ride_history_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PickRideView extends StatefulWidget {
  const PickRideView({Key? key}) : super(key: key);

  @override
  State<PickRideView> createState() => _PickRideViewState();
}

class _PickRideViewState extends State<PickRideView> {

  final _controller=Get.put(PickRideController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<PickRideController>
        (builder: (_controller){
        return SafeArea(
          child: Column(
            children: [
              3.height,
              myText(text: 'Book Seat', fontWeight: FontWeight.bold, size: 13.sp),
              2.height,
              Container(
                height: 6.h,
                width: double.infinity,
                color: primaryColor.withOpacity(0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myRow(availableColor, 'Available'),
                    myRow(unavailableColor, 'Unavailable'),
                    myRow(selectedColor, 'Selected'),
                  ],
                ),
              ),
              2.height,

              // main container
              SizedBox(
                height: 55.h + (_controller.seatsData.length / 3).ceil() * 20.0, // Adjust the height dynamically
                width: 55.w,
                //color: Colors.green,
                child: Stack(
                  children: [
                    // bus container
                    Container(
                      height: 25.h + (_controller.seatsData.length / 3).ceil() * 150.0, // Adjust the height dynamically
                      decoration: const BoxDecoration(
                        // color: Colors.cyan,
                          image: DecorationImage(image: AssetImage(AppAssets.bus), fit: BoxFit.fill)),
                    ),
                    // seats container
                    Positioned(
                      top: 10.h + (_controller.seatsData.length / 3).ceil() * 50.0,
                      left: 4.5.w,
                      child: SizedBox(
                        height: 25.h + (_controller.seatsData.length / 3).ceil() * 20.0, // Adjust the height dynamically
                        width: 42.w,
                        // color: Colors.blueAccent,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(AppAssets.unAvailableSeat),
                                GestureDetector(
                                    onTap: (){
                                      _controller.showSeatNumber(context,
                                          1.toString());
                                    },
                                    child: Image.asset(AppAssets.selectedSeat)),
                                GestureDetector(
                                    onTap: (){
                                      _controller.showSeatNumber(context,
                                          2.toString());

                                    },
                                    child: Image.asset(AppAssets.selectedSeat)),
                              ],),
                            0.5.height,
                            Image.asset(AppAssets.bar),
                            0.5.height,
                            _controller.buildSeatWidgets(context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(onPressed: (){
                    _controller.showAddSeatDialog(context);

                  },child: const Icon(Icons.add)),
                  FloatingActionButton(onPressed: (){
                    _controller.removeSeat();

                  },child:const Icon(Icons.remove)),

                ],
              ),

              const Spacer(),
              customButton(
                width: 80.w,
                text: 'Select Seat',
                onTap: () {
                  Get.to(const RideHistoryView());
                },
              ),
              2.height,
            ],
          ),
        );
      }),
    );
  }
  myRow(Color color, String title) {
    return Row(
      children: [
        Container(
          height: 4.h,
          width: 4.h,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8)),
        ),
        3.width,
        myText(text: title, color: unavailableColor, fontWeight: FontWeight.bold, size: 10.sp),
      ],
    ).animate().fade(duration: const Duration(seconds: 2)).slideX();
  }


}
