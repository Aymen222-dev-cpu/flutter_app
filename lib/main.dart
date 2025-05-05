import 'package:app6/Teatcher/teatcherhome.dart';
import 'package:app6/admin/adminhome.dart';
import 'package:app6/login_signin/login%20page.dart';
import 'package:app6/login_signin/rgistrion.dart';
import 'package:app6/student/studenthome.dart';
import 'package:app6/welcom/splashscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIza...your-api-key...",
        authDomain: "your-project.firebaseapp.com",
        projectId: "your-project-id",
        storageBucket: "your-project.appspot.com",
        messagingSenderId: "your-messaging-sender-id",
        appId: "your-app-id",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override

  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
    } else {
      print('User is signed in!================================================================================');
    }
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder:
          (_, child) => MaterialApp(
            theme: ThemeData(),
            debugShowCheckedModeBanner: false,

            home:
                FirebaseAuth.instance.currentUser == null
                    ? SplashScreen()
                    : Adminhome(),
            routes: {
              "/signup": (context) => Rgistrion(),
              "/homeAdmin": (context) => Adminhome(),
              "/login": (context) => Loginpage(),
              "/splash": (context) => SplashScreen(),
              "/student": (context) => Studenthome(),
              "/teacher": (context) => Teatcherhome(),
            },
          ),
    );
  }
}
