import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/favorites/favorites_page.dart';
import 'package:apple_bro_test/pages/home/home_screen.dart';
import 'package:apple_bro_test/pages/profile/final_ads_page.dart';
import 'package:apple_bro_test/provider/ads_provider.dart';
import 'package:apple_bro_test/provider/filter_provider.dart';
import 'package:apple_bro_test/provider/payment_provider.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => AdsProvider()),
        ChangeNotifierProvider(create: (context) => FilterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    StaticDatas.storage.initStorage;
    return MaterialApp(
      title: 'Apple Bro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: StaticColors.kBackgroundColor.withOpacity(0.94),
          elevation: 1,
          shadowColor: Colors.black,
          titleTextStyle: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      // home: StaticDatas.storage.read("firstTime") == "firstTime"
      //     ? const HomePage()
      //     : const SplashPage1(),
      home: FavoritesPage(),
    );
  }
}
