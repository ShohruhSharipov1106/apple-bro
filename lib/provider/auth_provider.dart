import 'package:apple_bro_test/constants/exports.dart';

class AuthProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
}
