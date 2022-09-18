import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/provider/ads_provider.dart';
import 'package:flutter/cupertino.dart';

class TileWithBottomSheet extends StatefulWidget {
  const TileWithBottomSheet({
    Key? key,
    required this.listTileTitles,
    required this.height,
    required this.width,
    required this.elements,
    required this.index,
    required this.title,
  }) : super(key: key);

  final List<String> listTileTitles;
  final double height;
  final double width;
  final List<List<String>> elements;
  final int index;
  final String title;

  @override
  State<TileWithBottomSheet> createState() => _TileWithBottomSheetState();
}

class _TileWithBottomSheetState extends State<TileWithBottomSheet> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.listTileTitles[widget.index],
        style: const TextStyle(
          color: StaticColors.kBlackTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
      ),
      onTap: () => (List<String> elemts, int selectInd, BuildContext context) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
          builder: (context) => StatefulBuilder(
            builder: (BuildContext context, setState) {
              return SizedBox(
                height: widget.height * 0.9,
                width: widget.width,
                child: Column(
                  children: [
                    Container(
                      height: widget.height * 0.075,
                      width: widget.width,
                      decoration: BoxDecoration(
                          color:
                              StaticColors.kBackgroundColor.withOpacity(0.94),
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10.0))),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              CupertinoIcons.chevron_back,
                              color: Color(0xff007AFF),
                              size: 28,
                            ),
                          ),
                          SizedBox(width: widget.width * 0.325),
                          Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(color: Colors.black.withOpacity(0.3), height: 1),
                    SizedBox(
                      height: widget.height * 0.8,
                      width: widget.width,
                      child: ListView.separated(
                        itemCount: elemts.length,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              elemts[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                color: Color(0xff000A14),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectInd = index;
                                if (elemts[0] == "iPhone X") {
                                  context.read<AdsProvider>().modeli =
                                      elemts[index];
                                } else if (elemts[0] == "Black") {
                                  context.read<AdsProvider>().rangi =
                                      elemts[index];
                                }
                              });
                              Navigator.pop(context);
                            },
                            trailing: selectInd == index
                                ? const Icon(
                                    CupertinoIcons.check_mark,
                                    color: Color(0xff007AFF),
                                  )
                                : const SizedBox(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }(widget.elements[widget.index], selected, context),
      trailing: const Icon(CupertinoIcons.right_chevron),
    );
  }
}
