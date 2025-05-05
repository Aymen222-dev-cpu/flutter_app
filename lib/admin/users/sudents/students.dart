import 'package:app6/admin/object/buttomprofileuser.dart';
import 'package:app6/profile/profile.dart';
import 'package:app6/services/databaseconection.dart';
import 'package:app6/services/editprofile.dart';
import 'package:app6/widget/palete.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaleteStudent extends StatefulWidget {
  final String cuTitel;
  const PaleteStudent({super.key, required this.cuTitel});

  @override
  State<PaleteStudent> createState() => _PaleteUsersState();
}

class _PaleteUsersState extends State<PaleteStudent> {
  late final String nameUser;
  late final String asset;
  List<QueryDocumentSnapshot> data = [];

  @override
  Widget build(BuildContext context) {
    return Palete(
      cuTitel: "Student",
      child: FutureBuilder<List<QueryDocumentSnapshot>>(
        future: getUsers(
          role: "Student",
          data: data,
        ), // استدعاء الدالة التي تجلب البيانات
        builder: (context, snapshot) {
          // 🔴 أثناء تحميل البيانات
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } //❌ في حال لم تكن هناك بيانات
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("لا يوجد Student"));
          }
          // ✅ البيانات جاهزة للعرض
          List<QueryDocumentSnapshot> data = snapshot.data!;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 65.h,
            ),
            itemBuilder: (context, i) {
              return Buttomprofileuser(
                okPress: () async {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(data[i].id)
                      .delete();
                  setState(() {
                    data.removeAt(i);
                  });
                },

                nameUser: data[i]['full_name'],
                Email: data[i]['email'],
                Phone: data[i]['phone'],
                Role: data[i]['role'],
                asset: 'images/admin.png',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Profile(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => EditProfile(
                                        oldname: data[i]['full_name'],
                                        oldemail: data[i]['email'],
                                        oldphone: data[i]['phone'],
                                        oldrole: data[i]['role'],
                                        oldpassword: data[i]['password'],
                                      ),
                                ),
                              );
                            },
                            namebutton: "Update",
                            Full_Name: data[i]['full_name'],
                          ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
