import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/favorites/components/main_card.dart';
import 'package:flutter/cupertino.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key});
  final likes = List.generate(10, (index) => true);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Sevimlilar"),
        bottom: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.025),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: StaticColors.kBlackTextColor,
                  ),
                ),
                GestureDetector(
                  child: Container(
                    width: size.width * 0.1,
                    height: size.height * 0.03,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: StaticColors.kGreyBorderColor),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: const Icon(
                      CupertinoIcons.slider_horizontal_3,
                      size: 18.0,
                      color: StaticColors.kActiveIconColor,
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SizedBox(
                        height: size.height * 0.5,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Reset"),
                                Text("Filter"),
                                Text("Tasdiqlash"),
                              ],
                            ),
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: const [
                                  Divider(),
                                  Text("Mahsulot turi"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: likes.length,
            itemBuilder: (BuildContext context, int index) {
              return MainCard(likes, index);
            },
          ),
        ),
      ),
    );
  }
}
