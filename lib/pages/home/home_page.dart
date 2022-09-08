import 'package:apple_bro_test/components/emblem_title.dart';
import 'package:apple_bro_test/constants/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EmblemTitle(),
        ],
      ),
    );
  }
}
