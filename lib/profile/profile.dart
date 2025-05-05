import 'package:app6/services/custombutton.dart';
import 'package:app6/services/databaseconection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String Full_Name;
  final String namebutton;
  final void Function()? onPressed;
  const Profile({
    super.key,
    required this.Full_Name,
    required this.onPressed,
    required this.namebutton,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<QueryDocumentSnapshot> data = [];
  @override
  String? email;
  String? Phone;
  String? Role;

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(color: const Color(0xFF50C2C9)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(width: 250),
                              Builder(
                                builder:
                                    (context) => IconButton(
                                      onPressed: () {
                                        Scaffold.of(context).openDrawer();
                                      },
                                      icon: Icon(Icons.menu, size: 35),
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Profile',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              FutureBuilder<List<QueryDocumentSnapshot>>(
                future: getUsers2(
                  name: widget.Full_Name,
                  data: data,
                ), // استدعاء الدالة التي تجلب البيانات
                builder: (context, snapshot) {
                  // 🔴 أثناء تحميل البيانات
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } //❌ في حال لم تكن هناك بيانات
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("لا يوجد USERS"));
                  }
                  // ✅ البيانات جاهزة للعرض
                  List<QueryDocumentSnapshot> data = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,

                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 140),
                            child: Container(
                              height: 500,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromARGB(255, 128, 216, 221),

                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(125, 0, 0, 0),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(4, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black12,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(125, 0, 0, 0),
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          offset: Offset(4, 4),
                                        ),
                                      ],
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'images/admin.png',
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 60),
                                  Text(
                                    "Full Name: ${data[i]['full_name']} \n"
                                    "Email: ${data[i]['email']}\n"
                                    "Phone: ${data[i]['phone']} \n"
                                    "Role: ${data[i]['role']} \n",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleSmall!.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),

              Padding(
                padding: const EdgeInsets.only(top: 650, left: 68),
                child: Custombutton(
                  answerButton: "${widget.namebutton}",
                  onPressed: widget.onPressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
