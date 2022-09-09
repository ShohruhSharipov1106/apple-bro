import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/home/components/best_choices_field.dart';
import 'package:apple_bro_test/pages/home/components/brendlar_field.dart';
import 'package:apple_bro_test/pages/home/components/havolalar_field.dart';
import 'package:apple_bro_test/pages/home/components/telefonlar_field.dart';
import 'package:iconly/iconly.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
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
                        Text(
                          "Apple Bro",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0,
                          ),
                        ),
                        SizedBox(width: size.width * 0.42),
                        CircleAvatar(
                          radius: 25.0,
                          backgroundColor: StaticColors.kGreyTextColor,
                          backgroundImage: NetworkImage(
                            "https://source.unsplash.com/random/5",
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
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                          focusedBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          hintText: "Qidirish",
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
              Padding(
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: StaticColors.kBlueTextColor,
        unselectedItemColor: StaticColors.kUnselectedItemColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyBold.home), label: ""),
          BottomNavigationBarItem(icon: Icon(IconlyLight.heart), label: ""),
          BottomNavigationBarItem(icon: Icon(IconlyLight.plus), label: ""),
          BottomNavigationBarItem(icon: Icon(IconlyLight.chat), label: ""),
          BottomNavigationBarItem(icon: Icon(IconlyLight.discovery), label: ""),
        ],
      ),
    );
  }
}
