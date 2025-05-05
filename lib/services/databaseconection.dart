import "package:awesome_dialog/awesome_dialog.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

//function to get users
Future<List<QueryDocumentSnapshot<Object?>>> getUsers({
  required String role,
  required List<QueryDocumentSnapshot> data,
}) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: '$role') // تصفية المشرفين فقط
          .get();
  data = querySnapshot.docs;
  return data;
}

Future<List<QueryDocumentSnapshot<Object?>>> getUsers2({
  required String name,
  required List<QueryDocumentSnapshot> data,
}) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance
          .collection('users')
          .where('full_name', isEqualTo: '$name') // تصفية المشرفين فقط
          .get();
  data = querySnapshot.docs;
  return data;
}

CollectionReference users = FirebaseFirestore.instance.collection('users');
// function to add user
Future<void> addUser(
  BuildContext context, {
  required String name,
  required String email,
  required String passsword,
  required String phone,
  required String role,
}) {
  // Call the user's CollectionReference to add a new user
  return users
      .add({
        'full_name': name, // John Doe
        'email': email, // Stokes and Sons
        'password': passsword, // 42
        'role': role,
        'phone': phone, // 42 // 42
      })
      .then((value) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.rightSlide,
          title: 'Success',
          desc: 'User added successfully.',
          btnCancelOnPress: () {},
          btnOkOnPress: () {},
        ).show();
      })
      .catchError(
        // ignore: invalid_return_type_for_catch_error
        (error) => print(
          "Failed to add user:+======================================================== $error",
        ),
      );
}

Future<void> updateUser(
  BuildContext context, { // أضف معرف المستخدم هنا
  required String name,
  required String email,
  required String password,
  required String phone,
  required String role,
}) async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance
          .collection('users')
          .where('full_name', isEqualTo: '$name') // تصفية المشرفين فقط
          .get();
  String userId = querySnapshot.docs.first.id;

  try {
    await users.doc(userId).update({
      'full_name': name,
      'email': email,
      'password': password,
      'role': role,
      'phone': phone,
    });

    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Success',
      desc: 'User updated successfully.',
    ).show();
    
    // الرجوع إلى الشاشة السابقة
  } catch (error) {
    print("Failed to update user: $error");
  }
}
Future<void> creatAccount({required String emailAddress,required String password})async{
try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}
Future<void> SgininUsers({
  required String emailAddress,
  required String password,})
async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print('User signed in: ${credential.user?.email}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      print(e);
    }
  }
