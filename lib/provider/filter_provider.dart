import 'package:apple_bro_test/constants/exports.dart';

class FilterProvider extends ChangeNotifier {
  String? type;
  Color? color;
  String? sikl;
  String? region;
  String? storage;
  String? battery;
  String? model;

  static const List<String> types = [
    "iPhone X",
    "Accessoires",
    "Mac",
    "iPad",
    "iWatch",
    "Xiomi"
  ];
  static const List<Color> colors = [
    Colors.grey,
    Colors.black,
    Color(0xffEBEBEB),
    Colors.orange
  ];
  static const List<String> colorLabels = ["Gray", "Black", "White", "Orange"];
  static const List<String> sikls = [
    "+80 % dan",
    "+90 % dan",
    "+70 % dan",
    "+100 % dan"
  ];
  static const List<String> regions = [
    "Tashkent",
    "Buxoro",
    "Samarqand",
    "Farg'ona",
    "Qo'qon",
    "Andijon",
    "Sirdaryo",
    "Jizzax",
    "Surxondaryo",
    "Toshkent shaxri",
    "Namangan",
    "Navoiy"
  ];
  static const List<String> storages = ["256 GB", "128 GB", "512 GB", "1 TB"];
  static const List<String> batteries = ["+98%", "+70%", "+60%", "+50%"];
  static const List<String> models = [
    "iPhone X",
    "iPhone 12 Pro",
    "iPhone 12 Pro Max",
    "iPhone 11 Pro Max",
    "iPhone 11 Pro",
    "iPhone 8"
  ];
}
