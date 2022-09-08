import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/splash/screens/splash_page3.dart';

class SplashPage2 extends StatelessWidget {
  const SplashPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      "assets/icons/store-front.svg",
      "Apple maxsulotlarini\nqulay va oson sotib oling!",
      SplashPage3(),
    );
  }
}
