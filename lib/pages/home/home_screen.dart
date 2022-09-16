import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/home/components/best_choices_field.dart';
import 'package:apple_bro_test/pages/home/components/brendlar_field.dart';
import 'package:apple_bro_test/pages/home/components/havolalar_field.dart';
import 'package:apple_bro_test/pages/home/components/telefonlar_field.dart';
import 'package:apple_bro_test/pages/profile/profile_page.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width,
            decoration: const BoxDecoration(
              color: StaticColors.kBlueButtonColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16.0),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.05),
                    const Text(
                      "Apple Bro",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                    SizedBox(width: size.width * 0.42),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 25.0,
                        backgroundColor: StaticColors.kGreyTextColor,
                        backgroundImage: NetworkImage(
                          "https://source.unsplash.com/random/5",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: StaticColors.kGreyBackColor,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: TextField(
                    controller: searchTextController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      focusedBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                      hintText: "Qidirish",
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        color: StaticColors.kGreyBorderColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HavolalarField(size: size),
                    TelefonlarField(size: size),
                    BrendlarField(size: size),
                    BestChoicesField(size: size),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
