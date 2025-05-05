import 'package:app6/admin/object/custombuttm3.dart';
import 'package:app6/admin/notifications/notificationspage.dart';
import 'package:app6/admin/time_table/timetablepage.dart';
import 'package:app6/admin/users/users.dart';
import 'package:app6/login_signin/rgistrion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customdicoriton1 extends StatefulWidget {
  const Customdicoriton1({super.key});

  @override
  State<Customdicoriton1> createState() => _Customdicoriton1State();
}

class _Customdicoriton1State extends State<Customdicoriton1> {
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
                    'ADMINISTRATOR',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: const Color(0xFF50C2C9),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.r,
                    ),
                  ),
                ),
                Custombuttm3(
                  answerButtom: 'Users',
                  myicon: Icons.person,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Userspage()),
                    );
                  },
                ),
                Custombuttm3(
                  answerButtom: 'User Registration',
                  myicon: Icons.app_registration,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Rgistrion()),
                    );
                  },
                ),
                Custombuttm3(
                  answerButtom: 'List Of Timetables',
                  myicon: Icons.table_chart_outlined,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Timetablepage()),
                    );
                  },
                ),
                Custombuttm3(
                  answerButtom: 'Notifications',
                  myicon: Icons.notifications,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Notificationspage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
