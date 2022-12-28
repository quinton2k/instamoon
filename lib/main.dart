import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instamoon/responsive/mobile_screen_layout.dart';
import 'package:instamoon/responsive/responsive_screen_layout.dart';
import 'package:instamoon/responsive/web_screen_layout.dart';
import 'package:instamoon/screens/login_screen.dart';
import 'package:instamoon/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyC8rlXCl6Sj2t2cja3YaoRnS2DZfRtwltA',
          appId: '1:886333418322:web:6324229203339fcd41e88b',
          messagingSenderId: "886333418322",
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
        home: LoginScreen(),
      );
  }
}
