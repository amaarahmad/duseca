import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
Widget myText({
  int? maxLine,
  required String text,TextAlign textAlignment=TextAlign.start, double size=15, FontWeight fontWeight= FontWeight.normal, Color color= Colors.black,}){
  return Text(
    maxLines: maxLine,
    text,style:  TextStyle(
    color:color,
    fontSize: size,
    overflow: TextOverflow.ellipsis,
    fontWeight:fontWeight,
  ),
    textAlign: textAlignment,
  );
}
extension EmptySpace on num {
  SizedBox get height => SizedBox (height: toDouble().h);
  SizedBox get width => SizedBox (width: toDouble().w);
}