import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/home/home_page.dart';
import 'package:apple_bro_test/pages/profile/change_lang_page.dart';
import 'package:apple_bro_test/pages/profile/components/profile_list_tile.dart';
import 'package:apple_bro_test/pages/profile/edit_password_page.dart';
import 'package:apple_bro_test/pages/profile/edit_profile_page.dart';
import 'package:apple_bro_test/pages/profile/final_ads_page.dart';
import 'package:apple_bro_test/pages/profile/your_card_page.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 12.0, top: 24.0),
              child: CircleAvatar(radius: 36),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
              child: Text(
                "${context.read<AuthProvider>().surnameController.text == "" ? "Kattabekov" : context.read<AuthProvider>().surnameController.text} ${context.read<AuthProvider>().nameController.text == "" ? "Jamshidbek" : context.read<AuthProvider>().nameController.text}",
                style: const TextStyle(
                  color: Color(0xff000A14),
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 23.0),
              child: Text(
                "Id: 15151515",
                style: TextStyle(
                  color: Color(0xff8D8D8D),
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
            ),
            ProfileListTile("Yakunlangan e’lonlar", FinalAdsPage()),
            ProfileListTile("Sizning hamyoningiz", const YourCardPage(),
                summa: "1 500 000 uzs", hasTrailing: true),
            ProfileListTile("To’lovlar tarixi", () {}),
            ProfileListTile("Profilni tahrirlash", const EditProfilePage()),
            ProfileListTile("Parolni o’zgartirish", const EditPasswordPage()),
            ProfileListTile("Tilni o’zgartirish", const ChangeLangPage()),
            ProfileListTile("Ilova haqida", () {}),
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 27),
              child: ProfileListTile("Profildan chiqish", const HomePage(),
                  hasPre: true),
            ),
            InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                      color: const Color(0xff000A14).withOpacity(0.1)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 3,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Agar savollaringiz bo’lsa?",
                      style: TextStyle(
                        color: Color(0xff000A14),
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 17),
                    const Text(
                      "+998 71 123 45 67",
                      style: TextStyle(
                        color: StaticColors.kBlueTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ButtonFields(() {}, "Позвонить"),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
