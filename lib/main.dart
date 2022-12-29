import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instamoon/responsive/mobile_screen_layout.dart';
import 'package:instamoon/responsive/responsive_screen_layout.dart';
import 'package:instamoon/responsive/web_screen_layout.dart';
import 'package:instamoon/screens/login_screen.dart';
import 'package:instamoon/screens/signup_screen.dart';
import 'package:instamoon/utils/colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "dotenv");
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: dotenv.env['apiKey'].toString(),
        appId: dotenv.env['appId'].toString(),
        messagingSenderId: dotenv.env['messagingSenderId'].toString(),
        projectId: "instamoon-16409",
        storageBucket: "instamoon-16409.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      title: 'Instamoon',
      // home: ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: SignupScreen(),
    );
  }
}
