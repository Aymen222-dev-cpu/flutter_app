import 'package:app6/login_signin/login%20page.dart';
import 'package:app6/student/customdicoriton2.dart';
import 'package:app6/widget/custommenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Studenthome extends StatefulWidget {
  const Studenthome({super.key});

  @override
  State<Studenthome> createState() => _StudenthomeState();
}

class _StudenthomeState extends State<Studenthome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF50C2C9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
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
                        child: ClipOval(
                          child: Image.asset(
                            'images/student.jpg',
                            width: 80.w,
                            height: 80.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Student Name',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20.w),
                Builder(
                  builder:
                      (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        icon: Icon(Icons.menu, size: 35),
                      ),
                ),
              ],
            ),

            Customdicoriton2(),
          ],
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(115, 80, 195, 201),
        child: CustomMenu(
          onTapH: () {},
          onTapL: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Loginpage()),
            );
          },
          onTapN: () {},
          onTapP: () {},
        ),
      ),
    );
  }
}
