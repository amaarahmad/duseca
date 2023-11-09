
import 'package:get/get.dart';

class LoginController extends GetxController{

  RxBool passHide=true.obs;
  RxBool check=true.obs;

  passHideUnHide(){
    passHide.value=!passHide.value;
  }
  checkTrueFalse(){
    check.value=!check.value;
  }
}

