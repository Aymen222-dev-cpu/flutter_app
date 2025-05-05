import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custombutton extends StatelessWidget {
  final answerButton;
  final void Function()? onPressed;
  const Custombutton({
    super.key,
    required this.answerButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: Colors.black12,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(125, 0, 0, 0),
              spreadRadius: 2.r,
              blurRadius: 10.r,
              offset: Offset(4.r, 4.r),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF50C2C9),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
            child: Text(
              '$answerButton',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                fontFamily: 'Arial',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
