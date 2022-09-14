import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parolni tahrirlash"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(
              CupertinoIcons.left_chevron,
              color: StaticColors.kActiveIconColor,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Center(
            child: InputFields(
              "Eski parol",
              context.read<AuthProvider>().oldPasswordController,
              context.read<AuthProvider>().oldPasswordController.text == ""
                  ? "Parol kiritish"
                  : context.read<AuthProvider>().oldPasswordController.text,
              TextInputType.name,
              8,
              hasEye: true,
            ),
          ),
          InputFields(
            "Yangi yarol",
            context.read<AuthProvider>().newPasswordController,
            context.read<AuthProvider>().newPasswordController.text == ""
                ? "87654321"
                : context.read<AuthProvider>().newPasswordController.text,
            TextInputType.name,
            8,
            hasEye: true,
          ),
          const Spacer(),
          ButtonFields(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          }, "Saqlash"),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        ],
      ),
    );
  }
}
