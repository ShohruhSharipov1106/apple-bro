import 'package:apple_bro_test/constants/exports.dart';
import 'package:flutter/cupertino.dart';

class BestChoicesField extends StatelessWidget {
  const BestChoicesField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10.0, bottom: size.height * 0.05, right: size.width * 0.05),
      child: Column(
        children: [
          TitleField(size: size, "Eng yaxshi tanlovlar"),
          SizedBox(height: size.height * 0.01),
          SizedBox(
            height: size.height * 0.92,
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
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: const  Offset(-2, 2),
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
                          vertical: size.height * 0.02,
                          horizontal: size.width * 0.02,
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
                              child: CircleAvatar(
                                backgroundColor: Colors.grey.withOpacity(0.75),
                                child: const Icon(
                                  CupertinoIcons.heart,
                                  color: Colors.white,
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
                        decoration: const  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(16.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
