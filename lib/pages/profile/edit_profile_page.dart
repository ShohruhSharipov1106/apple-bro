import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profilni tahrirlash"),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Center(
            child: InputFields(
              "Ism",
              context.read<AuthProvider>().nameController,
              context.read<AuthProvider>().nameController.text == ""
                  ? "Anvar"
                  : context.read<AuthProvider>().nameController.text,
              TextInputType.name,
              50,
            ),
          ),
          InputFields(
            "Familya",
            context.read<AuthProvider>().surnameController,
            context.read<AuthProvider>().surnameController.text == ""
                ? "Tursunov"
                : context.read<AuthProvider>().surnameController.text,
            TextInputType.name,
            100,
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
