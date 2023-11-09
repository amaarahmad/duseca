// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:duseca_task/const/colors.dart';
import 'package:duseca_task/const/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TabButtonComponent extends StatelessWidget {
  String title;
  final VoidCallback onPressed;
  final isSelected;
  TabButtonComponent(this.title, this.onPressed,
      {super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
              color: isSelected ? primaryColor : primaryColor.withOpacity(0.5),

              fontSize: 12.sp,
              fontWeight: FontWeight.bold),
            ),
            1.height,

            Container(
              height: 0.2.h,
              width: 18.w,
              color: isSelected?primaryColor:Colors.transparent,
            )
          ],
        ));
  }
}
