import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/auth/sign_in/sign_in_page.dart';
import 'package:apple_bro_test/pages/home/home_page.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  String icon;
  String title;
  // ignore: prefer_typing_uninitialized_variables
  var route;
  SplashScreen(this.icon, this.title, this.route, {super.key});

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
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: StaticColors.kBlackBorderColor,
                  width: 2,
                ),
              ),
              child: CircleAvatar(
                radius: size.height * 0.13,
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(icon),
              ),
            ),
            SizedBox(height: size.height * 0.13),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
            SizedBox(height: size.height * 0.07),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(size.width * 0.88, size.height * 0.05),
                  backgroundColor: StaticColors.kBlueButtonColor,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => route));
              },
              child: const Text(
                "Keyingisi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        StaticDatas.storage.read("firstTime") == "firstTime"
                            ? HomePage()
                            : SignInPage(),
                  ),
                );
              },
              child: const Text(
                "O'tkazib yuborish",
                style: TextStyle(
                  color: StaticColors.kBlueTextColor,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
