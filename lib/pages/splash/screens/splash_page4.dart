import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/auth/sign_in/sign_in_page.dart';

class SplashPage4 extends StatelessWidget {
  const SplashPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen("assets/icons/currency-circle-dollar.svg",
        "Apple Broga soting!", SignInPage());
  }
}
