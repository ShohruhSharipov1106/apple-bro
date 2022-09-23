import 'dart:math';

import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/home/components/best_choices_field.dart';
import 'package:apple_bro_test/pages/home/components/brendlar_field.dart';
import 'package:apple_bro_test/pages/home/components/havolalar_field.dart';
import 'package:apple_bro_test/pages/home/components/telefonlar_field.dart';
import 'package:apple_bro_test/pages/home/details/components/search_delegate.dart';
import 'package:apple_bro_test/pages/profile/profile_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Text(""),
        leadingWidth: size.width * 0.05,
        title: const Text(
          "Apple Bro",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size(200, size.height * 0.1),
          child: GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            child: Container(
              height: size.height * 0.05,
              width: size.width * 0.9,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: StaticColors.kGreyBackColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const TextField(
                enabled: false,
                decoration: InputDecoration(
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
          ),
        ),
        actions: [
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
          SizedBox(width: size.width * 0.05),
        ],
        backgroundColor: StaticColors.kBlueButtonColor,
        elevation: 0,
        toolbarHeight: size.height * 0.075,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HavolalarField(size: size),
              TelefonlarField(size: size),
              _carouselSliderMethod(size, Colors.white),
              BrendlarField(size: size),
              BestChoicesField(size: size),
              _carouselSliderMethod(size, const Color(0xff2473F2))
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _carouselSliderMethod(Size size, Color color) {
    return SizedBox(
      width: size.width * 0.97,
      height: size.height * 0.175,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.05),
            child: SizedBox(
              width: size.width * 0.92,
              height: size.height * 0.175,
              child: CarouselSlider(
                items: [
                  _sliderCard(size),
                  _sliderCard(size),
                  _sliderCard(size),
                  _sliderCard(size),
                  _sliderCard(size),
                ],
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  autoPlayCurve: Curves.linearToEaseOut,
                  enlargeCenterPage: true,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.01,
            right: size.width * 0.4,
            child: Container(
              height: size.height * 0.02,
              width: size.width * 0.22,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffB8BCBF).withOpacity(0.2),
              ),
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: activeIndex == index
                          ? color
                          : const Color(0xff000A14),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _sliderCard(Size size) {
    return SizedBox(
      width: size.width * 0.9,
      height: size.height * 0.2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(
                "https://source.unsplash.com/random/${Random().nextInt(10)}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
