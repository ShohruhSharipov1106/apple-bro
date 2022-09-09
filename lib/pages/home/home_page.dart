import 'package:apple_bro_test/components/emblem_title.dart';
import 'package:apple_bro_test/constants/exports.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EmblemTitle(),
                Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, bottom: size.height * 0.05),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Havolalar",
                            style: TextStyle(
                              color: StaticColors.kBlackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: size.width * 0.55),
                          Text(
                            "Barchasi",
                            style: TextStyle(
                              color: StaticColors.kActiveBorderColor,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      SizedBox(
                        height: size.height * 0.08,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) => const DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff357AF6),
                                  Color(0xffF635C0),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      StaticColors.kActiveBorderColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.0,
                      bottom: size.height * 0.05,
                      right: size.width * 0.05),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Telefonlar",
                            style: TextStyle(
                              color: StaticColors.kBlackColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: size.width * 0.55),
                          Text(
                            "Barchasi",
                            style: TextStyle(
                              color: StaticColors.kActiveBorderColor,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      SizedBox(
                        height: size.height * 0.8,
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 20,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.75,
                          ),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              Colors.grey.withOpacity(0.75),
                                          child: SvgPicture.asset(index % 2 == 0
                                              ? "assets/icons/white-apple.svg"
                                              : "assets/icons/discount.svg"),
                                        ),
                                        GestureDetector(
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.grey.withOpacity(0.75),
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
                                    decoration: BoxDecoration(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
