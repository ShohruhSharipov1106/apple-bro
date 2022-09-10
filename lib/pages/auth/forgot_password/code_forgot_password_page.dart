import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/auth/sign_in/sign_in_page.dart';

// ignore: must_be_immutable
class CodeForgotPasswordPage extends StatelessWidget {
  CodeForgotPasswordPage({super.key});
  final smsTextController = TextEditingController();
  final newPasswordTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                const EmblemTitle(),
                SizedBox(height: size.height * 0.03),
                InputFields(
                  "SMS Code",
                  smsTextController,
                  "161315645",
                  TextInputType.number,
                  4,
                ),
                InputFields(
                  "Yangi parol",
                  newPasswordTextController,
                  "151354916",
                  TextInputType.visiblePassword,
                  8,
                ),
                SizedBox(height: size.height * 0.15),
                ButtonFields(
                  () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    }
                  },
                  "Tasdiqlash",
                ),
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
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage())),
                      child: Text(
                        "Ro'yxatdan o'tish",
                        style: GoogleFonts.inter(
                          fontSize: 14.0,
                          color: StaticColors.kActiveBorderColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
