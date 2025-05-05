import 'package:app6/student/custombuttom4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customdicoriton2 extends StatefulWidget {
  const Customdicoriton2({super.key});

  @override
  State<Customdicoriton2> createState() => _Customdicoriton2State();
}

class _Customdicoriton2State extends State<Customdicoriton2> {
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
                    'Welcome Student',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: const Color(0xFF50C2C9),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.r,
                    ),
                  ),
                ),
                Custombuttom4(
                  answerButtom: 'claim',
                  myicon: Icons.arrow_outward_rounded,
                  onPressed: () {},
                ),
                Custombuttom4(
                  answerButtom: 'Timetables',
                  myicon: Icons.calendar_view_month,
                  onPressed: () {},
                ),
                Custombuttom4(
                  answerButtom: 'Notifications',
                  myicon: Icons.notifications,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
