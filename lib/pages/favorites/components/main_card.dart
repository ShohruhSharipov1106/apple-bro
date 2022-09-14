import 'package:apple_bro_test/constants/exports.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class MainCard extends StatefulWidget {
  List<bool> likes;
  int index;
  MainCard(this.likes, this.index, {super.key});

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Visibility(
      visible: widget.likes[widget.index],
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              "assets/images/iphone-background.png",
              widget.likes[widget.index],
              "assets/icons/discount.svg",
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
            image: const DecorationImage(
              image: AssetImage("assets/images/iphone-background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                    horizontal: size.width * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.75),
                        child: SvgPicture.asset(
                          widget.index % 2 == 0
                              ? "assets/icons/white-apple.svg"
                              : "assets/icons/discount.svg",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.likes[widget.index] =
                                !widget.likes[widget.index];
                            widget.likes.removeAt(widget.index);
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.75),
                          child: const Icon(
                            CupertinoIcons.heart_fill,
                            color: StaticColors.kRedColor,
                          ),
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
                      left: 15.0, top: 12.0, bottom: 10.0, right: 10.0),
                  width: size.width,
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
    );
  }
}
