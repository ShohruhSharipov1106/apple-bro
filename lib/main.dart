import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/auth/sign_in/sign_in_page.dart';
import 'package:apple_bro_test/pages/home/details/details_page.dart';
import 'package:apple_bro_test/pages/home/home_page.dart';
import 'package:apple_bro_test/pages/splash/screens/splash_page1.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StaticDatas.storage.read("firstTime") == "firstTime"
          ? HomePage()
          : const SplashPage1(),
    
    );
  }
}
