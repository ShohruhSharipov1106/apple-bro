import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/home/details/components/characteristics.dart';
import 'package:apple_bro_test/pages/home/details/components/elev_button.dart';
import 'package:apple_bro_test/pages/home/details/components/item_card.dart';
import 'package:apple_bro_test/pages/home/details/components/out_button.dart';
import 'package:apple_bro_test/pages/home/details/components/whose_ads.dart';
import 'package:apple_bro_test/provider/ads_provider.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class AdsConditionPage extends StatefulWidget {
  String image;
  bool liked;
  String subtitleIcon;
  AdsConditionPage(this.image, this.liked, this.subtitleIcon, {super.key});

  @override
  State<AdsConditionPage> createState() => _AdsConditionPageState();
}

class _AdsConditionPageState extends State<AdsConditionPage> {
  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final read = context.read<AdsProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  setState(() {
                    activePage = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: size.width,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            CupertinoIcons.left_chevron,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: Colors.grey.withOpacity(0.75),
                              child: SvgPicture.asset(widget.subtitleIcon),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.liked = !widget.liked;
                                });
                              },
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.grey.withOpacity(0.75),
                                child: Icon(
                                  widget.liked
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.heart,
                                  color: widget.liked
                                      ? StaticColors.kRedColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 3,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: activePage == 0
                                ? Border.all(color: StaticColors.kBlueTextColor)
                                : Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: size.width * 0.22,
                            height: size.height * 0.1,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: activePage == 1
                                ? Border.all(color: StaticColors.kBlueTextColor)
                                : Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: size.width * 0.22,
                            height: size.height * 0.1,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: activePage == 2
                                ? Border.all(color: StaticColors.kBlueTextColor)
                                : Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: size.width * 0.22,
                            height: size.height * 0.1,
                            margin: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 26.0, bottom: 35.0, left: 16.0, right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Bugun 15:20",
                                style: TextStyle(
                                  color: StaticColors.kSubtitleColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 12.0),
                              Icon(
                                CupertinoIcons.eye,
                                color: StaticColors.kSubtitleColor,
                                size: 21.0,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                "1522",
                                style: TextStyle(
                                  color: StaticColors.kSubtitleColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "MacBook Pro M1 512/16 MacBook Pro M1 512/16   M1 ",
                            style: TextStyle(
                              color: StaticColors.kBlackTextColor,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            read.priceController.text != ""
                                ? read.priceController.text
                                : "16 000 000 UZS",
                            style: const TextStyle(
                              color: StaticColors.kBlackTextColor,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          _title("Tavsif"),
                          Text(
                            read.tavsifController.text != ""
                                ? read.tavsifController.text
                                : "iPhone 10xs 64gb kumush sotiladi holati yaxshi. Men sotib olganimdek sotaman yangi telefon modeli.Ekrandagi oyna hech qachon original bo'lmaydi ayni paytda o'zgarganiPhone 10xs 64gb kumush sotiladi holati yaxshi. Men sotib olganimdek sotaman yangi telefon modeli.Ekrandagi oyna hech qachon original bo'lmaydi ayni paytda o'zgargan",
                            style: const TextStyle(
                              color: StaticColors.kSubtitleColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          _title("Xarakteristikasi"),
                          const ItemChars(),
                          _title("Joylashuv"),
                          Container(
                            width: size.width,
                            height: size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: StaticColors.kActiveBorderColor,
                              image: const DecorationImage(
                                image: AssetImage("assets/images/bitmap.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  read.locationController.text != ""
                                      ? read.locationController.text
                                      : "Ташкент, Чиланзарский\nТашкент, Чиланзарский район",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Icon(
                                  IconlyLight.location,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                              ],
                            ),
                          ),
                          _title("E’lon beruvchi"),
                          const Owner(),
                          _title("Qo’shimcha tovarlar"),
                          const ItemCard(),
                          const SizedBox(height: 24),
                          OutlinButton(
                              size: MediaQuery.of(context).size,
                              function: () {
                                Navigator.pop(context);
                              },
                              title: "Orqaga"),
                          const SizedBox(height: 12),
                          ButtonFields(() {}, "E'lon berish"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _title(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        const Divider(color: Color(0xffECECEC), height: 1),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            color: StaticColors.kBlackTextColor,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class Owner extends StatelessWidget {
  const Owner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage("https://source.unsplash.com/random"),
        ),
        const SizedBox(width: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: context.read<AdsProvider>().ownerNameController.text == ""
                    ? "Kattabekov Jamshidbek\n"
                    : context.read<AdsProvider>().ownerNameController.text,
                style: const TextStyle(
                  color: StaticColors.kBlackTextColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const TextSpan(
                text: "Oxirgi online vaqti: 15:30",
                style: TextStyle(
                  color: StaticColors.kSubtitleColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ItemChars extends StatelessWidget {
  const ItemChars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<AdsProvider>();
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Text(
            "Markasi\n\nChiqarilgan sanasi\n\nRangi\n\nHolati\n\nHududi\n\nBatarekasi",
            style: TextStyle(
              color: StaticColors.kSubtitleColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            "${read.modeli}\n\n15.08.2021\n\n${read.rangi}\n\n${read.holati}\n\n${read.locationController.text}\n\n94 %",
            style: const TextStyle(
              color: StaticColors.kBlackTextColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
