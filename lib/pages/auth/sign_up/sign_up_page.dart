import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/auth/sign_up/sms_code_page.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final phoneTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final surnameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.1),
                InputFields(
                  "Telefon raqam",
                  phoneTextController,
                  "Telefon raqamingiz",
                  TextInputType.phone,
                  13,
                ),
                InputFields(
                  "Ism",
                  nameTextController,
                  "Ismingiz",
                  TextInputType.text,
                  2,
                ),
                InputFields(
                  "Familiya",
                  surnameTextController,
                  "Familiyangiz",
                  TextInputType.text,
                  3,
                ),
                InputFields(
                  "Parol",
                  passwordTextController,
                  "Parol kiritish",
                  TextInputType.visiblePassword,
                  hasEye: true,
                  8,
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
                ButtonFields(() {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SMSCodePage()),
                    );
                  }
                }, "Keyingisi"),
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
      ),
    );
  }
}
