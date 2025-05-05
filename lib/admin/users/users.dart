import 'package:app6/admin/users/admin/admins.dart';
import 'package:app6/admin/users/sudents/students.dart';
import 'package:app6/admin/users/teatchers/teachers.dart';
import 'package:app6/student/custombuttom4.dart';
import 'package:app6/widget/palete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Userspage extends StatefulWidget {
  const Userspage({super.key});

  @override
  State<Userspage> createState() => _UserspageState();
}

class _UserspageState extends State<Userspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: const Color(0xFF50C2C9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Palete(
              cuTitel: 'Users',
              child: Column(
                children: [
                  Custombuttom4(
                    answerButtom: 'Admin',
                    myicon: Icons.person,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaleteAdmin(cuTitel: 'Admins'),
                        ),
                      );
                    },
                  ),
                  Custombuttom4(
                    answerButtom: 'Student',
                    myicon: Icons.person,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => PaleteStudent(cuTitel: 'Students'),
                        ),
                      );
                    },
                  ),
                  Custombuttom4(
                    answerButtom: 'Teacher',
                    myicon: Icons.person,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => PaleteTeachers(cuTitel: 'Teachers'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
