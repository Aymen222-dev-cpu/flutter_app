import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custombuttm3 extends StatelessWidget {
  final IconData myicon;
  final String answerButtom;
  final void Function()? onPressed;
  const Custombuttm3({
    super.key,
    required this.onPressed,
    required this.answerButtom,
    required this.myicon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.r,
        left: 16.r,
        right: 16.r,
        bottom: 20.r,
      ),
      child: Container(
        height: 80.h,
        width: 400.w,
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
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 20.r,
              right: 0.r,
              left: 0.r,
              top: 16.r,
            ),
            child: Row(
              children: [
                Icon(myicon, size: 30, color: Colors.white),
                SizedBox(width: 20),
                Text(
                  '$answerButtom',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
