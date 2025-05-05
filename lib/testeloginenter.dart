import 'package:app6/Teatcher/teatcherhome.dart';
import 'package:app6/admin/adminhome.dart';
import 'package:app6/student/studenthome.dart';
import 'package:flutter/material.dart';

class Testeloginenter extends StatefulWidget {
  const Testeloginenter({super.key});

  @override
  State<Testeloginenter> createState() => _TesteloginenterState();
}

class _TesteloginenterState extends State<Testeloginenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Adminhome( Full_Name: ' ',
                  Email: '',
                  Phone: '',
                  role: '',)),
              );
            },
            child: Text('Admin'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Teatcherhome()),
              );
            },
            child: Text('Teatcher'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Studenthome()),
              );
            },
            child: Text('Student'),
          ),
        ],
      ),
    );
  }
}
