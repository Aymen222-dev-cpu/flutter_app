import 'package:app6/widget/palete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notificationspage extends StatelessWidget {
  const Notificationspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: const Color(0xFF50C2C9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            Palete(
              cuTitel: 'Notifications',
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      'Notifications',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color(0xFF50C2C9),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.r,
                      ),
                    ),
                  ),
                  //Here we will add the obejct that we want to display in the palete
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
