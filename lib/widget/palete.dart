import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Palete extends StatelessWidget {
  final String cuTitel;
  final Widget child;
  const Palete({super.key, required this.cuTitel, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            height: 673.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
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
                SizedBox(height: 20.h),
                Center(
                  child: Text(
                    "$cuTitel",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: const Color(0xFF50C2C9),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.r,
                    ),
                  ),

                  //Here we will add the obejct that we want to display in the palete
                ),
                Expanded(
                  child: Align(alignment: Alignment.topCenter, child: child),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
