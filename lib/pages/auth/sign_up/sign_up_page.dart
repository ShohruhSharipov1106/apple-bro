import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/auth/sign_up/sms_code_page.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

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
                SizedBox(height: size.height * 0.05),
                const EmblemTitle(),
                SizedBox(height: size.height * 0.01),
                InputFields(
                  "Telefon raqam",
                  context.read<AuthProvider>().phoneController,
                  context.read<AuthProvider>().phoneController.text == ""
                      ? "Telefon raqamingiz"
                      : context.read<AuthProvider>().phoneController.text,
                  TextInputType.phone,
                  13,
                ),
                InputFields(
                  "Ism",
                  context.read<AuthProvider>().nameController,
                  context.read<AuthProvider>().nameController.text == ""
                      ? "Ismingiz"
                      : context.read<AuthProvider>().nameController.text,
                  TextInputType.text,
                  2,
                ),
                InputFields(
                  "Familiya",
                  context.read<AuthProvider>().surnameController,
                  context.read<AuthProvider>().surnameController.text == ""
                      ? "Familyangiz"
                      : context.read<AuthProvider>().surnameController.text,
                  TextInputType.text,
                  3,
                ),
                InputFields(
                  "Parol",
                  context.read<AuthProvider>().oldPasswordController,
                  context.read<AuthProvider>().oldPasswordController.text == ""
                      ? "Parol kiritish"
                      : context.read<AuthProvider>().oldPasswordController.text,
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
