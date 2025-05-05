import 'package:app6/login_signin/paletlogin.dart';
import 'package:app6/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController name = TextEditingController();
  TextEditingController nr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: const Color(0xFF50C2C9),
      body: SingleChildScrollView(
        child: Column(children: [SizedBox(height: 80.h), Logo(), Paletlogin()]),
      ),
    );
  }
}
