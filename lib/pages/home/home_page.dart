import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/add_ads/ads_page.dart';
import 'package:apple_bro_test/pages/chat/contact_page.dart';
import 'package:apple_bro_test/pages/favorites/favorites_page.dart';
import 'package:apple_bro_test/pages/home/home_screen.dart';
import 'package:apple_bro_test/pages/lifehack/lifehack_page.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List pages = [
    HomeScreen(),
    const FavoritesPage(),
    const AdsPage(),
    const ContactPage(),
    const LifelackPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticColors.kBackgroundColor,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: StaticColors.kBlueTextColor,
        unselectedItemColor: StaticColors.kUnselectedItemColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(IconlyBold.home), label: ""),
          const BottomNavigationBarItem(
              icon: Icon(IconlyBold.heart), label: ""),
          BottomNavigationBarItem(
              icon: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff699FFF),
                        Color(0xff134EB7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  )),
              label: ""),
          const BottomNavigationBarItem(icon: Icon(IconlyBold.chat), label: ""),
          const BottomNavigationBarItem(
              icon: Icon(IconlyBold.discovery), label: ""),
        ],
      ),
    );
  }
}
