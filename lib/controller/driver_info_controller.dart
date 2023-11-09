import 'package:duseca_task/view/tabs/billing.dart';
import 'package:duseca_task/view/tabs/earning.dart';
import 'package:duseca_task/view/tabs/no_rides.dart';
import 'package:duseca_task/view/tabs/reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DriverInfoTabController extends GetxController {

  RxInt selectedIndex=0.obs;
  RxBool isOpen=true.obs;

  void changeOpen(){
    isOpen.value=!isOpen.value;
  }

  List<String>labels=[
    'Earnings',
    'No. Rides',
    'Billings',
    'Reviews',
  ];
  List<Widget> contentScreen=[
    const EarningTab(),
    const NoRideTab(),
    const BillingTab(),
    const ReviewTab(),
  ];

  void onPressedIndex(int index){
    selectedIndex.value=index;
  }


}