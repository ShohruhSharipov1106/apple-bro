import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/auth/sign_in/sign_in_page.dart';

// ignore: must_be_immutable
class SMSCodePage extends StatelessWidget {
  SMSCodePage({Key? key}) : super(key: key);

  final smsTextController = TextEditingController();
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
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              InputFields(
                "SMS code",
                smsTextController,
                "1265141651",
                TextInputType.number,
                4,
              ),
              SizedBox(height: size.height * 0.02),
              ButtonFields(() {
                 if (formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  }
              }, "Tasdiqlash"),
            ],
          ),
        ),
      ),
    );
  }
}
