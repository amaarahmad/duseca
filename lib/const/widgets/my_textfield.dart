import 'package:country_code_picker/country_code_picker.dart';
import 'package:duseca_task/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

var ctrl= Get.put(LoginController());

customTextField({
  required String hintText,
  var controller,
  IconData? prefixIcon,
  String? prefixText,
  IconData? suffixIcons,
  bool? prefixTrue = false,
  bool? suffix = false,
  bool isPass = false,
  Color? filledColor,
  Color? borderColor,
  TextInputType? keyBoardType = TextInputType.text,
  int? maxLine,
  String? Function(String?)? validator, // Validator function
}) {
  return SizedBox(
    height: 5.5.h,
    child: TextFormField(
      controller: controller,
      maxLines: maxLine??1,
      obscureText: isPass,
      keyboardType: keyBoardType,
      validator: validator, // Set the validator function
      decoration: InputDecoration(

        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffix == true
            ? IconButton(
          icon: Icon(
            ctrl.passHide.value == true
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            ctrl.passHideUnHide();
          },
        )
            : null,
        prefixText: prefixTrue == true ? "$prefixText" : null,
        hintStyle:  TextStyle(

          fontSize: 10.sp,
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.w400,
        ),
        fillColor: filledColor??Colors.white,

        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color:borderColor??Colors.white),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color:borderColor??Colors.green),
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:  BorderSide(color:borderColor??Colors.red),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color:Colors.green),
          borderRadius: BorderRadius.circular(50),

        ),


      ),
    ),
  );
}

phoneNumber({
  required String hintText,
  var controller,
  String? prefixText,
  IconData? suffixIcons,
  bool? prefixTrue = false,
  bool? suffix = false,
  bool isPass = false,
  Color? filledColor,
  Color? borderColor,
  TextInputType? keyBoardType = TextInputType.text,
  int? maxLine,
  String? Function(String?)? validator, // Validator function
}) {
  return SizedBox(
    height: 5.5.h,
    child: TextFormField(
      controller: controller,
      maxLines: maxLine??1,
      obscureText: isPass,
      keyboardType: keyBoardType,
      validator: validator, // Set the validator function
      decoration: InputDecoration(

        hintText: hintText,
        suffixIcon: suffix == true
            ? IconButton(
          icon: Icon(
            ctrl.passHide.value == true
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            ctrl.passHideUnHide();
          },
        )
            : null,
        prefixText: prefixTrue == true ? "$prefixText" : null,
        prefixIcon: CountryCodePicker(
          showFlagDialog: true,
          showDropDownButton: true,

          onChanged: (CountryCode countryCode) {
            //print("Selected country: ${countryCode.name}");
            //print("Selected code: ${countryCode.dialCode}");
          },
          initialSelection: 'US', // Initial selected country code
          favorite: const['US', 'CA'], // Favorite countries
          showFlag: false,
        ),
        hintStyle:  TextStyle(

          fontSize: 10.sp,
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.w400,
        ),
        fillColor: filledColor??Colors.white,

        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color:borderColor??Colors.white),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color:borderColor??Colors.green),
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:  BorderSide(color:borderColor??Colors.red),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  const BorderSide(color:Colors.green),
          borderRadius: BorderRadius.circular(50),

        ),


      ),
    ),
  );
}