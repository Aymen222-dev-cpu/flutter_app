import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final bool isPassword;
  final String cudf;
  final TextEditingController mycontroller;
  final String? Function(String?) validator;
  const CustomTextFiled({
    super.key,
    required this.cudf,
    required this.mycontroller,
    required this.validator,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 16, right: 32, left: 32),
      child: TextFormField(
        obscureText: isPassword,
        cursorColor: const Color(0xFF50C2C9),
        validator: validator,
        controller: mycontroller,
        decoration: InputDecoration(
          
          hintText: '$cudf',
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 185, 187, 187),
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF50C2C9), width: 3),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF50C2C9), width: 5),
          ),
        ),
      ),
    );
  }
}
