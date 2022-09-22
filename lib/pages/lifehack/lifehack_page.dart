import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/lifehack/components/lifehack_components.dart';

class LifelackPage extends StatelessWidget {
  const LifelackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Life-hack")),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return LifeHackComponents(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
