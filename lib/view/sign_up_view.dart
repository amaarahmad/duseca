import 'package:duseca_task/const/colors.dart';
import 'package:duseca_task/const/widgets/my_button.dart';
import 'package:duseca_task/const/widgets/my_text.dart';
import 'package:duseca_task/const/widgets/my_textfield.dart';
import 'package:duseca_task/controller/login_controller.dart';
import 'package:duseca_task/view/pick_ride_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? selectedOption; // To store the selected option

  bool check=true;

  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final phController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final _key=GlobalKey<FormState>();
  final loginController=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  6.height,
                  Center(
                    child: Container(
                      width: 30.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: primaryColor,
                          width: 2
                        )
                      ),
                      child: Center(
                        child: myText(text: 'Duseca',color: primaryColor,size: 17.sp,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ).animate().fade(duration: const Duration(seconds: 2)).scaleX(),
                  2.height,
                  Center(child: myText(text: 'SignUp today',fontWeight: FontWeight.bold,size: 16.sp)).animate().fade(duration: Duration(seconds: 2)).slideY(),
                  1.height,
                  Center(child: myText(text: 'Provide us more credential to start\n                 journey with us',maxLine: 2)).animate().fade(duration: Duration(seconds: 2)).slide(),
                  2.height,
                  myText(text: 'Your name',fontWeight: FontWeight.bold),
                  1.height,
                  customTextField(controller:nameController ,hintText: 'e.g John Doe',borderColor: Colors.grey.withOpacity(0.5),maxLine: 1),
                  2.height,
                  myText(text: 'Your email',fontWeight: FontWeight.bold),
                  1.height,
                  customTextField(controller: emailController,hintText: 'youremail@gmail.com',borderColor: Colors.grey.withOpacity(0.5)),
                  2.height,
                  myText(text: 'Phone no*',fontWeight: FontWeight.bold),
                  1.height,
                  phoneNumber(controller: phController,hintText: '310-XXXXXXXXXX',borderColor: Colors.grey.withOpacity(0.5)),
                  2.height,
                  myText(text: 'Password',fontWeight: FontWeight.bold),
                  1.height,
                  Obx(() =>customTextField(controller: passwordController,hintText: '************',borderColor: Colors.grey.withOpacity(0.5),suffix:true ,isPass: loginController.passHide.value),),
                  2.height,
                  myText(text: 'Confirm password',fontWeight: FontWeight.bold),
                  1.height,
                  Obx(() =>customTextField(controller: confirmPasswordController,hintText: '************',borderColor: Colors.grey.withOpacity(0.5),suffix: true),),
                 Row(
                   children: [
                     Flexible(
                       flex: 1,
                       child: RadioListTile<String>(
                         title: myText(text: 'Passenger',size: 9.sp),
                         value: 'type',
                         groupValue: selectedOption,
                         onChanged: (value) {
                           setState(() {
                             selectedOption = value;
                           });
                         },
                       ),
                     ),
                     Flexible(
                       flex: 1,
                       child: RadioListTile<String>(
                         title: myText(text: 'Driver',size: 9.sp),
                         value: 'type 2',
                         groupValue: selectedOption,
                         onChanged: (value) {
                           setState(() {
                             selectedOption = value;
                           });
                         },
                       ),
                     ),
                   ],
                 ),
                  Row(
                    children: [
                     Obx(() =>  Checkbox(
                         fillColor:const MaterialStatePropertyAll(Colors.green),
                         shape: const OvalBorder(
                           side: BorderSide(color:Colors.green,width: 0),
                         ),
                         value: loginController.check.value, onChanged: (value){
                       loginController.checkTrueFalse();
                     }),),
                      myText(text: 'Password must be at least 8 Character,uppercase,\nlowercase and unique code',size: 8.sp,maxLine: 2),
                    ],
                  ),
                  customButton(width: double.infinity, text: 'Create Account',textSize: 15.sp,onTap: (){
                    Get.to(const PickRideView());
                  }),

                  2.height,


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
