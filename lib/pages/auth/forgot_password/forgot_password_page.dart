import 'package:apple_bro_test/constants/exports.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final phoneTextController = TextEditingController();

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
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              InputFields(
                "Telefon raqam",
                phoneTextController,
                "Telefon raqamingiz",
                TextInputType.number,
              ),
              SizedBox(height: size.height * 0.38),
              ButtonFields(() {}, "Kodni qabul qilish"),
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
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
