import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/home/home_page.dart';

// ignore: must_be_immutable
class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  GlobalKey<FormState> formKey = GlobalKey();
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.1),
                const EmblemTitle(),
                SizedBox(height: size.height * 0.03),
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
                ButtonFields(
                  () {
                    if (formKey.currentState!.validate()) {
                      StaticDatas.storage.write("firstTime", "firstTime");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const HomePage()));
                    }
                  },
                  "Kirish",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
