import 'package:app6/models/paletetimetiblepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Timetablepage extends StatelessWidget {
  const Timetablepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: const Color(0xFF50C2C9),
      body: SingleChildScrollView(
        child: Column(
          children: [SizedBox(height: 40.h), Paletetimetiblepage()],
        ),
      ),
    );
  }
}
