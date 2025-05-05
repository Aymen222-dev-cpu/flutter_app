import 'package:app6/admin/object/customdicoriton.dart';
import 'package:app6/login_signin/login%20page.dart';
import 'package:app6/profile/profile.dart';
import 'package:app6/widget/custommenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Adminhome extends StatelessWidget {
  final String? Full_Name;
  final Email;
  final Phone;
  final role;

  const Adminhome({
    super.key,
    this.Full_Name,
    this.Email,
    this.Phone,
    this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF50C2C9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              'images/admin.png',
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
                    'Admin Name',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    child: Builder(
                      builder:
                          (context) => IconButton(
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            icon: Icon(Icons.menu, size: 35),
                          ),
                    ),
                  ),
                ],
              ),

              Customdicoriton1(),
            ],
          ),
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
          onTapP: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => Profile(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Loginpage()),
                        );
                      },
                      namebutton: "Log Out",
                      Full_Name: "$Full_Name",
                    ),
              ),
            );
          },
        ),
      ),
    );
  }
}
