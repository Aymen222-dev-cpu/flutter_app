import 'package:app6/Teatcher/teatcherhome.dart';
import 'package:app6/admin/adminhome.dart';
import 'package:app6/services/custombutton.dart';
import 'package:app6/services/customtextfiled.dart';
import 'package:app6/services/databaseconection.dart';
import 'package:app6/student/studenthome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clip_shadow/flutter_clip_shadow.dart';
import 'package:app6/widget/customClipPath.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:path/path.dart';

class Paletlogin extends StatefulWidget {
  const Paletlogin({super.key});

  @override
  State<Paletlogin> createState() => _PaletloginState();
}

class _PaletloginState extends State<Paletlogin> {
  final TextEditingController name = TextEditingController();
  final TextEditingController nr = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Stack(
          children: [
            ClipShadow(
              clipper: Customclippath(),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 60,
                  spreadRadius: 1,
                  offset: Offset(4, 4),
                ),
              ],
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.r),
                    topRight: Radius.circular(60.r),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.r,
                    bottom: 0.r,
                    left: 0.r,
                    right: 0.r,
                  ),
                  child: Text(
                    ' Gets things done with ToDo',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: const Color(0xFF50C2C9),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                CustomTextFiled(
                  cudf: 'Enter Full Name', //email
                  mycontroller: name, //email
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Enter Full "; //email
                    }
                  },
                  isPassword: false, //email
                ),
                CustomTextFiled(
                  cudf: 'Enter Password',
                  mycontroller: nr,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please Enter Registration Number';
                    }
                  },
                  isPassword: true, //password
                ),
                Custombutton(
                  answerButton: "Login",
                  onPressed: () async {
                    try {
                      QuerySnapshot result =
                          await _firestore
                              .collection('users')
                              .where('password', isEqualTo: nr.text)
                              .where('full_name', isEqualTo: name.text)
                              .get();

                      if (result.docs.isEmpty) {
                        print("User not found!");
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'User not found!',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        ).show();
                        return null;
                      }

                      // جلب بيانات المستخدم
                      Map<String, dynamic> userData =
                          result.docs.first.data() as Map<String, dynamic>;
                      print(
                        "You have successfully logged in.: ${userData['full_name']}",
                      );
                      SgininUsers(
                        emailAddress: userData['email'],
                        password: userData['password'],
                      );
                      // تسجيل الدخول
                      if (userData['role'] == 'Admin') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => Adminhome(
                                  Full_Name: "${userData['full_name']}",
                                  role: "${userData['role']}",
                                  Email: "${userData['email']}",
                                  Phone: "${userData['phone']}",
                                ),
                          ),
                        );
                      } else if (userData['role'] == 'Student') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Studenthome(),
                          ),
                        );
                      } else if (userData['role'] == 'Teacher') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Teatcherhome(),
                          ),
                        );
                      }
                    } catch (e) {
                      print("An error occurred while logging in.: $e");
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'An error occurred while logging in.',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
                    }
                  },
                ),
                SizedBox(height: 200.h),
                Text(
                  'welcom to your university ',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
