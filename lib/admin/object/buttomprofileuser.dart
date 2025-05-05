import 'package:app6/profile/profile.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Buttomprofileuser extends StatelessWidget {
  final void Function()? onPressed;
  final String asset;
  final String nameUser;
  final String Email;
  final String Phone;
  final String Role;
  final void Function()? okPress;

  const Buttomprofileuser({
    super.key,
    required this.nameUser,
    required this.asset,
    required this.onPressed,
    required this.Email,
    required this.Phone,
    required this.Role,
    required this.okPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
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
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF50C2C9),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.values[3],
              children: [
                Image.asset(asset, width: 60, height: 60),
                // Add spacing between image and text
                Text(
                  nameUser,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                    fontFamily: 'Arial',
                  ),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'Delete') {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.rightSlide,
                        title: 'Warning',
                        desc: 'User added successfully.',
                        btnCancelOnPress: () {
                          print('Cancel');
                        },
                        btnOkOnPress: okPress,
                      ).show();
                    } else if (value == 'Profile') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Profile(
                                onPressed: () {},
                                namebutton: "Update",
                                Full_Name: nameUser,
                              ),
                        ),
                      );
                    }
                  },
                  itemBuilder:
                      (BuildContext context) => [
                        PopupMenuItem(
                          value: "Delete",
                          child: Row(
                            children: [Icon(Icons.delete), Text("Delete")],
                          ),
                        ),

                        PopupMenuItem(
                          value: "Profile",
                          child: Row(
                            children: [Icon(Icons.person), Text("Profile")],
                          ),
                        ),
                      ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
