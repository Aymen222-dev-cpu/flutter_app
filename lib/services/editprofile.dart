import 'package:app6/services/custombutton.dart';
import 'package:app6/services/databaseconection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app6/services/customtextfiled.dart';

class EditProfile extends StatefulWidget {
  final String oldname;
  final String oldemail;
  final String oldphone;
  final String oldrole;
  final String oldpassword;
  const EditProfile({
    super.key,
    required this.oldname,
    required this.oldemail,
    required this.oldphone,
    required this.oldrole,
    required this.oldpassword,
  });

  @override
  State<EditProfile> createState() => _PaletrgistrionState();
}

class _PaletrgistrionState extends State<EditProfile> {
  @override
  void initState() {
    name.text = widget.oldname;
    email.text = widget.oldemail;
    phone.text = widget.oldphone;
    passsword.text = widget.oldpassword;
    role = widget.oldrole;
    setState(() {});
    super.initState();
  }

  final TextEditingController name = TextEditingController();
  final TextEditingController passsword = TextEditingController();
  final TextEditingController email = TextEditingController();
  String? role;
  final TextEditingController phone = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                      'User Update',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color(0xFF50C2C9),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.r,
                      ),
                    ),
                  ),
                  CustomTextFiled(
                    cudf: 'Enter Full Name',
                    mycontroller: name,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Enter Full Name';
                      }
                      return null;
                    },

                    isPassword: false,
                  ),

                  CustomTextFiled(
                    cudf: 'Enter Eamail',
                    mycontroller: email,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Enter Email';
                      }
                      return null;
                    },
                    isPassword: false,
                  ),
                  CustomTextFiled(
                    cudf: 'Enter Regisrtion Number',
                    mycontroller: passsword,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Enter Registration Number';
                      }
                    },
                    isPassword: true,
                  ),
                  CustomTextFiled(
                    cudf: 'Enter phone Number',
                    mycontroller: phone,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Enter Phone Number';
                      }
                      return null;
                    },
                    isPassword: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),

                    child: SizedBox(
                      height: 50.h,

                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Select Role',
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 185, 187, 187),
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF50C2C9),
                              width: 3,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF50C2C9),
                              width: 5,
                            ),
                          ),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please Select Role';
                          }
                        },
                        value: role,

                        onChanged: (String? newValue) {
                          setState(() {
                            role = newValue!;
                          });
                        },

                        items:
                            <String>[
                              'Student Admin',
                              'Student',
                              'Admin',
                              'Teacher',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                  Custombutton(
                    answerButton: "Save",
                    onPressed: () {
                      
                      updateUser(
                        context,
                        name: name.text,
                        email: email.text,
                        password: passsword.text,
                        phone: phone.text,
                        role: role!,
                      );

                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
