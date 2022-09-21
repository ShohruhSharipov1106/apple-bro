import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/add_ads/add_ads_page.dart';
import 'package:flutter/cupertino.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({super.key});

  @override
  State<AdsPage> createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  String adType = "Oddiy e'lon berish";
  List<String> adTypes = ["Apple Bro bilan", "Oddiy e'lon berish"];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("E'lon berish"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 34),
            _title(),
            const SizedBox(height: 8),
            _adConditionField(width, height),
            const SizedBox(height: 59),
            _bodyLabel(),
            const SizedBox(height: 40),
            SizedBox(
              width: width * 0.6,
              height: height * 0.25,
              child: PageView.builder(
                clipBehavior: Clip.none,
                itemCount: 4,
                onPageChanged: (v) {
                  setState(() {
                    pageIndex = v;
                  });
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 24,
                        spreadRadius: 0,
                        color: Colors.grey[300]!,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: const [
                      SizedBox(height: 17),
                      Icon(
                        CupertinoIcons.book,
                        color: Color(0xff007AFF),
                        size: 45,
                      ),
                      SizedBox(height: 12),
                      Text(
                        "1.Siz bilan haridorlar o’rtasidagi\nsavdoni bir necha xil usullarda\namalga oshirish imkoniga\negasiz",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8d8d8d),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: width *  0.1),
              child: SizedBox(
                width: width * 0.2,
                height: height * 0.01,
                child: ListView.builder(
                  itemCount: 4,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: CircleAvatar(
                        backgroundColor: pageIndex == index
                            ? StaticColors.kActiveIconColor
                            : Colors.black26,
                        radius: width * 0.008),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 46),
            ButtonFields(() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddAdsPage(adType),
                ),
              );
            }, "Boshlash")
          ],
        ),
      ),
    );
  }

  Text _bodyLabel() {
    return const Text(
      "Text Apple Bro bilan\nsotish afzalliklari",
      style: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  Container _adConditionField(double width, double height) {
    return Container(
      width: width * 0.92,
      height: height * 0.065,
      decoration: BoxDecoration(
        color: const Color(0xff767680).withOpacity(0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      child: Row(
        children: [
          _adCondition(adTypes[0]),
          _adCondition(adTypes[1]),
        ],
      ),
    );
  }

  Text _title() {
    return const Text(
      "E'lon berish turini tanlang",
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.black26,
      ),
      textAlign: TextAlign.center,
    );
  }

  Expanded _adCondition(String text) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            adType = text;
          });
        },
        child: Card(
          color: adType == text ? Colors.white : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: adType == text ? 1.5 : 0,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
