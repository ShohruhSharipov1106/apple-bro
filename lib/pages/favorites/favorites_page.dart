import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/favorites/components/filter_body.dart';
import 'package:apple_bro_test/pages/favorites/components/main_card.dart';
import 'package:flutter/cupertino.dart';

List filters = [];

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
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
                SizedBox(
                  width: size.width * 0.4,
                  height: size.height * 0.05,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Chip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide(
                                color:
                                    const Color(0xff000A14).withOpacity(0.2))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        label: Text(
                          filters[index],
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff000A14),
                          ),
                        ),
                        deleteIcon: CircleAvatar(
                          backgroundColor:
                              const Color(0xff747480).withOpacity(0.08),
                          child: Icon(
                            Icons.clear,
                            color: const Color(0xff3C3C43).withOpacity(0.6),
                          ),
                        ),
                      );
                    },
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
                      isDismissible: false,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16))),
                      builder: (context) =>
                          StatefulBuilder(builder: (context, setState) {
                        return SizedBox(
                            height: size.height * 0.8,
                            child: const FilterBody());
                      }),
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
