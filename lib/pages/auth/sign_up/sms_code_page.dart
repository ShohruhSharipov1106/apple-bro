import 'package:apple_bro_test/constants/exports.dart';

class SMSCodePage extends StatelessWidget {
  SMSCodePage({Key? key}) : super(key: key);

  final smsTextController = TextEditingController();

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
              ),
              SizedBox(height: size.height * 0.02),
              ButtonFields(() {}, "Tasdiqlash"),
            ],
          ),
        ),
      ),
    );
  }
}
