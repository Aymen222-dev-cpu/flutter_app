import 'package:app6/login_signin/login%20page.dart';
import 'package:app6/logo.dart';
import 'package:app6/welcom/customstack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    await Future.delayed(
      const Duration(seconds: 2),
    ); // ⏳ انتظار 2 ثانية قبل الفحص
    User? user = _auth.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(user.uid).get();

      if (userDoc.exists) {
        String role = userDoc["role"];

        if (role == "Admin") {
          Navigator.pushReplacementNamed(context, '/homeAdmin');
          return;
        } else if (role == "Student") {
          Navigator.pushReplacementNamed(context, '/student');
          return;
        } else if (role == "Teacher") {
          Navigator.pushReplacementNamed(context, '/teacher');
          return;
        }
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Loginpage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF50C2C9),
      body: Column(
        children: [
          SizedBox(height: 150.h),
          const Logo(),
          SizedBox(height: 150.h),
          const CustomStack(),
        ],
      ),
    );
  }
}
