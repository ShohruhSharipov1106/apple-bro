import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/auth/components/sign_in_with_fields.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final phoneTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final surnameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/background-3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              InputFields(
                "Telefon raqam",
                phoneTextController,
                "Telefon raqamingiz",
                TextInputType.number,
              ),
              InputFields(
                "Ism",
                nameTextController,
                "Ismingiz",
                TextInputType.text,
              ),
              InputFields(
                "Familiya",
                surnameTextController,
                "Familiyangiz",
                TextInputType.text,
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
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(width: size.width * 0.17),
                    SignInWithFields(() {}, "assets/icons/google.svg"),
                    SignInWithFields(() {}, "assets/icons/apple.svg"),
                    // edit logo
                    SignInWithFields(() {}, "assets/icons/facebook.svg"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
