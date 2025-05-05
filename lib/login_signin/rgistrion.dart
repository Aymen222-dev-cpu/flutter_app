import 'package:flutter/material.dart';
import 'package:app6/login_signin/paletrgistrion.dart';

class Rgistrion extends StatefulWidget {
  const Rgistrion({super.key});

  @override
  State<Rgistrion> createState() => _RgistrionState();
}

class _RgistrionState extends State<Rgistrion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF50C2C9),
      body: SingleChildScrollView(
        child: Column(children: [SizedBox(height: 50), Paletrgistrion()]),
      ),
    );
  }
}
