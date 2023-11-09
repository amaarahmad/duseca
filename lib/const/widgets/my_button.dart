import 'package:duseca_task/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
Widget customButton(
    {required double width,
      double height = 45,
      double textSize=14,
      required String text,
      bool? border=false,
      Callback? onTap,
      bool? borderRadius= false,
      Color color=primaryColor,
      Color textColor = Colors.white}) {
  return Container(
    width:  width,
    height: height,
    decoration: BoxDecoration(
      color: color,
      border: border==true? Border.all(color: primaryColor, style: BorderStyle.solid): null,
      borderRadius: borderRadius==false?BorderRadius.circular(6):BorderRadius.circular(30),
    ),
    child: ClipRRect(
      borderRadius: borderRadius==false?BorderRadius.circular(6):BorderRadius.circular(30),
      child: MaterialButton(
        onPressed: onTap,
        height: height,
        color: color,
        child: Center(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: textSize, fontFamily: 'Poppins'),
            )),
      ),
    ),
  );
}
