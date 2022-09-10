import 'package:apple_bro_test/constants/exports.dart';
import 'package:flutter/cupertino.dart';

class BestChoicesField extends StatefulWidget {
  const BestChoicesField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<BestChoicesField> createState() => _BestChoicesFieldState();
}

class _BestChoicesFieldState extends State<BestChoicesField> {
  final List liked = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10.0,
          bottom: widget.size.height * 0.05,
          right: widget.size.width * 0.05),
      child: Column(
        children: [
          TitleField(size: widget.size, "Eng yaxshi tanlovlar"),
          SizedBox(height: widget.size.height * 0.01),
          SizedBox(
            height: widget.size.height * 0.92,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
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
                      liked[index],
                      index % 2 == 0
                          ? "assets/icons/white-apple.svg"
                          : "assets/icons/discount.svg",
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        blurRadius: 2,
                        spreadRadius: 2,
                        offset: const Offset(-2, 2),
                      ),
                    ],
                    color: StaticColors.kActiveBorderColor,
                    borderRadius: BorderRadius.circular(16.0),
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
                            vertical: widget.size.height * 0.02,
                            horizontal: widget.size.width * 0.02,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(0.75),
                                child: SvgPicture.asset(index % 2 == 0
                                    ? "assets/icons/white-apple.svg"
                                    : "assets/icons/discount.svg"),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    liked[index] = !liked[index];
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      Colors.grey.withOpacity(0.75),
                                  child: Icon(
                                    liked[index]
                                        ? CupertinoIcons.heart_fill
                                        : CupertinoIcons.heart,
                                    color: liked[index]
                                        ? StaticColors.kRedColor
                                        : Colors.white,
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
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16.0),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              left: 15.0, top: 12.0, bottom: 10.0, right: 10.0),
                          width: widget.size.width,
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
    );
  }
}
