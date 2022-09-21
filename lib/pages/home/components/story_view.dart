import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/home/home_screen.dart';
import 'package:flutter_stories/flutter_stories.dart';

// ignore: must_be_immutable
class StoryView extends StatelessWidget {
  String image;
  StoryView(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Story(
      onFlashForward: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen())),
      onFlashBack: () => Navigator.pop(context),
      momentBuilder: (context, index) {
        return Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: StaticColors.kActiveIconColor,
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 16),
                    const Text(
                      "Yangi Macbook Pro 2021",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                      iconSize: 32,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    const SizedBox(width: 16),
                  ],
                )
              ],
            ),
          ),
        );
      },
      momentDurationGetter: (duration) => const Duration(seconds: 5),
      momentCount: 4,
    );
  }
}
