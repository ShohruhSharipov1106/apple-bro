import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/favorites/components/filter_body.dart';
import 'package:apple_bro_test/provider/filter_provider.dart';
import 'package:flutter/cupertino.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5.0),
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
                    width: size.width * 0.65,
                    height: size.height * 0.05,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: context.read<FilterProvider>().filters.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Chip(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                                side: BorderSide(
                                    color: const Color(0xff000A14)
                                        .withOpacity(0.2))),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            label: Text(
                              context.read<FilterProvider>().filters[index],
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff000A14),
                              ),
                            ),
                            onDeleted: () {
                              context.read<FilterProvider>().filters.remove(
                                  context
                                      .read<FilterProvider>()
                                      .filters[index]);
                            },
                            deleteIconColor:
                                const Color(0xff3C3C43).withOpacity(0.6),
                            deleteIcon: CircleAvatar(
                              backgroundColor:
                                  const Color(0xff747480).withOpacity(0.08),
                              child: const Icon(Icons.clear, size: 15),
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
                        border:
                            Border.all(color: StaticColors.kGreyBorderColor),
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
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16))),
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.92,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        "https://source.unsplash.com/random/$index",
                        false,
                        index % 2 == 0
                            ? "assets/icons/white-apple.svg"
                            : "assets/icons/discount.svg",
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: StaticColors.kActiveBorderColor,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.25),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(2, 2),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://source.unsplash.com/random/$index"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.02,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Colors.grey.withOpacity(0.75),
                                  child: SvgPicture.asset(
                                    index % 2 == 0
                                        ? "assets/icons/white-apple.svg"
                                        : "assets/icons/discount.svg",
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor:
                                      Colors.grey.withOpacity(0.75),
                                  child: const Icon(
                                    CupertinoIcons.heart,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 15.0,
                                top: 12.0,
                                bottom: 10.0,
                                right: 10.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(16.0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Apple iPhone 12 (Green, 64 GB)",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                    color: StaticColors.kBlackTextColor,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  "\$829",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: StaticColors.kBlackTextColor,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  "21.10.2021",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: StaticColors.kSubtitleColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
