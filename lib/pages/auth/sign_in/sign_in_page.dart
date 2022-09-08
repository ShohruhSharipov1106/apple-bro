import 'package:apple_bro_test/constants/exports.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final phoneTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/background-3.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.2),
              InputFields(
                "Telefon raqam",
                phoneTextController,
                "Telefon raqamingiz",
                TextInputType.number,
              ),
              InputFields(
                "Parol",
                passwordTextController,
                "Parol kiritish",
                TextInputType.visiblePassword,
                hasEye: true,
              ),
              SizedBox(
                width: size.width * 0.85,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage(),
                      ),
                    ),
                    child: Text(
                      "Parolni unutdingizmi?",
                      style: GoogleFonts.inter(
                        color: StaticColors.kBlueTextColor,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              ButtonFields(() {}, "Kirish"),
              SizedBox(height: size.height * 0.02),
              Text(
                "Kirish uchun qo'shimcha",
                style: GoogleFonts.inter(
                  color: StaticColors.kGreyTextColor,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  SizedBox(width: size.width * 0.17),
                  SignInWithFields(() {}, "assets/icons/google.svg"),
                  SignInWithFields(() {}, "assets/icons/apple.svg"),
                  // edit logo
                  SignInWithFields(() {}, "assets/icons/facebook.svg"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Akkaunt yo'qmi?",
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      color: StaticColors.kGreyTextColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage())),
                    child: Text(
                      "Ro'yxatdan o'tish",
                      style: GoogleFonts.inter(
                        fontSize: 14.0,
                        color: StaticColors.kActiveBorderColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
