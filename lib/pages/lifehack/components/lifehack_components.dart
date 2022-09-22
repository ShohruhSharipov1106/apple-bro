import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/lifehack/components/video_page.dart';

// ignore: must_be_immutable
class LifeHackComponents extends StatelessWidget {
  int index;
  LifeHackComponents(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: _smallCard(size, 1)),
                        Expanded(flex: 1, child: _smallCard(size, 2)),
                        Expanded(flex: 1, child: _smallCard(size, 3)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(flex: 1, child: _smallCard(size, 4)),
                              Expanded(flex: 1, child: _smallCard(size, 5)),
                            ],
                          ),
                        ),
                        Expanded(flex: 2, child: _bigCard(size, context)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(flex: 1, child: _smallCard(size, 7)),
                        Expanded(flex: 1, child: _smallCard(size, 8)),
                        Expanded(flex: 1, child: _smallCard(size, 9)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: _bigCard(size, context)),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(flex: 1, child: _smallCard(size, 10)),
                              Expanded(flex: 1, child: _smallCard(size, 11)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _smallCard(Size size, int ind) {
    return Container(
      height: size.height * 0.15,
      width: size.width * 0.32,
      margin: const EdgeInsets.all(1),
      color: Colors.blue,
      child: Image.network(
        "https://source.unsplash.com/random/${index + ind}",
        fit: BoxFit.cover,
      ),
    );
  }

  GestureDetector _bigCard(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => const VideoPage())),
      child: Container(
        height: size.height * 0.3,
        width: size.width * 0.64,
        margin: const EdgeInsets.all(1),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            image: NetworkImage(
              "https://source.unsplash.com/random/${index + 6}",
            ),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: const Icon(
          Icons.play_arrow_rounded,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
