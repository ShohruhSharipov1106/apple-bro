import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/splash/screens/splash_page2.dart';

class SplashPage1 extends StatelessWidget {
  const SplashPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/background-2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.25),
            CircleAvatar(
              radius: size.height * 0.12,
              backgroundColor: Colors.transparent,
              child: Image.asset("assets/icons/medium-emblem.png"),
            ),
            const Text(
              "Apple Bro ilovasiga\nxush kelibsiz",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.0,
                color: StaticColors.kBlackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            const Text(
              "Notification text would be placed right here. This is\nwhere notification text would be placed.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.0,
                color: StaticColors.kGreyTextColor,
              ),
            ),
            SizedBox(height: size.height * 0.23),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width * 0.88, size.height * 0.05),
                  backgroundColor: StaticColors.kBlueButtonColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SplashPage2()));
              },
              child: const Text(
                "Davom etish",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
