import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStack extends StatelessWidget {
  const CustomStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 200.h,
            width: 340.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40.r),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(125, 0, 0, 0),
                  spreadRadius: 2.r,
                  blurRadius: 10.r,
                  offset: Offset(4.r, 4.r),
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Center(
                  child: Text(
                    '👋 Welcome to \nthe University App',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: const Color(0xFF50C2C9),
                      fontWeight: FontWeight.bold,
                      fontSize: 24.r,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
