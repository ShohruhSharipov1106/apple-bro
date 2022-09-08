import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/auth/forgot_password/forgot_password_page.dart';
import 'package:apple_bro_test/pages/auth/sign_in/sign_in_page.dart';
import 'package:apple_bro_test/pages/auth/sign_up/sign_up_page.dart';
import 'package:apple_bro_test/pages/home/home_page.dart';
import 'package:apple_bro_test/pages/splash/screens/splash_page1.dart';
import 'package:apple_bro_test/pages/splash/screens/splash_page2.dart';
import 'package:apple_bro_test/pages/splash/screens/splash_page3.dart';
import 'package:apple_bro_test/pages/splash/screens/splash_page4.dart';
import 'package:apple_bro_test/pages/splash/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apple Bro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home:  SignInPage(),
    );
  }
}
