import 'package:apple_bro_test/constants/exports.dart';

class PaymentProvider extends ChangeNotifier {
  String cardCapital = "1 500 000";
  addCash(String funds) {
    cardCapital = cardCapital.replaceAll(" ", "");
    cardCapital = "${int.parse(cardCapital) + int.parse(funds)}";
    notifyListeners();
  }
}
