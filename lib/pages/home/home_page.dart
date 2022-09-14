import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/chat/contact_page.dart';
import 'package:apple_bro_test/pages/favorites/favorites_page.dart';
import 'package:apple_bro_test/pages/home/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
    FavoritesPage(),
    const ContactPage(),
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
        items: const [
          BottomNavigationBarItem(icon: Icon(IconlyBold.home), label: ""),
          BottomNavigationBarItem(icon: Icon(IconlyBold.heart), label: ""),
          BottomNavigationBarItem(icon: Icon(IconlyBold.plus), label: ""),
          BottomNavigationBarItem(icon: Icon(IconlyBold.chat), label: ""),
          BottomNavigationBarItem(icon: Icon(IconlyBold.discovery), label: ""),
        ],
      ),
    );
  }
}
