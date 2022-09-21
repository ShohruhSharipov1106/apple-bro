import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/add_ads/ads_condition_page.dart';
import 'package:apple_bro_test/pages/add_ads/components/tile_with_bottom_sheet.dart';
import 'package:apple_bro_test/provider/ads_provider.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class AddAdsPage extends StatefulWidget {
  String title;
  AddAdsPage(this.title, {super.key});

  @override
  State<AddAdsPage> createState() => _AddAdsPageState();
}

class _AddAdsPageState extends State<AddAdsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController ownerEmailController = TextEditingController();
  final TextEditingController ownerPhoneController = TextEditingController();
  final List<String> listTileTitles = ["Brend", "Model", "Rang", "Storage"];
  bool agreed = false;
  bool sticker = false;
  String currency = "uz";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: const Icon(
              CupertinoIcons.left_chevron,
              color: StaticColors.kActiveIconColor,
              size: 30.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: height * 0.15,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage("assets/images/video_background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.play_arrow_solid,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Text("Qanday qilib e'lon berish kerak",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
            _titleField(width, height, "Rasm yuklash"),
            SizedBox(
              width: width * 0.95,
              height: height * 0.3,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return index == 4
                      ? Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffEFF2F4),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.all(25),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color(0xffF9F9F9).withOpacity(0.78),
                            child:
                                const Icon(Icons.add, color: Color(0xff8E8E93)),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            image: const DecorationImage(
                              image: AssetImage(
                                  "assets/images/iphone-background.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.all(5.0),
                          alignment: Alignment.topRight,
                          child: InkWell(
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color(0xffF9F9F9).withOpacity(0.78),
                              radius: 12,
                              child: const Icon(CupertinoIcons.clear,
                                  size: 15, color: Color(0xff8E8E93)),
                            ),
                          ),
                        );
                },
              ),
            ),
            _titleField(width, height, "E'lon sarlavhasi"),
            CustomInput(
              size: size,
              textController: searchController,
              hint: "Text",
            ),
            SizedBox(height: height * 0.02),
            SizedBox(
              width: width * 0.95,
              height: height * 0.31,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listTileTitles.length,
                separatorBuilder: (context, index) =>
                    const Divider(endIndent: 16.0),
                itemBuilder: (BuildContext context, int index) {
                  return TileWithBottomSheet(
                    listTileTitles: listTileTitles,
                    height: height,
                    width: width,
                    elements: const [
                      [
                        "iPhone",
                        "iPad",
                        "Mac",
                        "AirPods",
                        "Accessoires",
                        "iWatch",
                        "Xiomi"
                      ],
                      [
                        "iPhone X",
                        "iPhone 11",
                        "iPhone 12",
                        "iPhone 12 Pro",
                        "iPhone 12 Pro Max",
                        "iPhone 13 Pro Max"
                      ],
                      ["Black", "Red", "Grey", "Choco", "Silver"],
                      ["256 GB", "128 GB", "512 GB", "1 TB"]
                    ],
                    index: index,
                    title: [
                      "Brend",
                      "Model",
                      "Color",
                      "Storage Capacity"
                    ][index],
                  );
                },
              ),
            ),
            const Divider(indent: 8, endIndent: 16),
            _titleField(width, height, "Holati"),
            Container(
              width: width * 0.92,
              height: height * 0.065,
              decoration: BoxDecoration(
                color: const Color(0xff767680).withOpacity(0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
              child: Row(
                children: [
                  _phoneCondition("Yangi", "Yangi"),
                  _phoneCondition("Ishlatilgan", "Ishlatilgan"),
                ],
              ),
            ),
            _titleField(width, height, "Tavsif"),
            CustomInput(
              size: size,
              textController: context.read<AdsProvider>().tavsifController,
              hint: "Tavsif",
              height: 0.25,
              textInputType: TextInputType.multiline,
              maxLine: 50,
            ),
            _titleField(width, height, "Narx"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomInput(
                    size: size,
                    textController: context.read<AdsProvider>().priceController,
                    hint: "15 000 000",
                    width: 0.74,
                    textInputType: TextInputType.number,
                  ),
                  Container(
                    height: size.height * 0.06,
                    width: size.width * 0.17,
                    decoration: BoxDecoration(
                      color: StaticColors.kGreyBackColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.only(right: 8, left: 12),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        borderRadius: BorderRadius.circular(8.0),
                        icon: const Icon(CupertinoIcons.chevron_down,
                            color: Color(0xff8E8E93), size: 18.0),
                        value: currency,
                        items: const [
                          DropdownMenuItem(
                            value: "uz",
                            child: Text(
                              "uzs",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "eu",
                            child: Text(
                              "ye.",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            currency = value.toString();
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            _titleField(width, height, "Aloqa uchun informatsiyalar"),
            CustomInput(
              size: size,
              textController: context.read<AdsProvider>().locationController,
              hint: " Yunusobod Tumani , Unversam bozori ...",
              preIcon: const Icon(
                CupertinoIcons.location_solid,
                color: Color(0xff0071E3),
              ),
            ),
            _titleField(width, height, "Aloqa uchun"),
            CustomInput(
              size: size,
              textController: context.read<AdsProvider>().ownerNameController,
              hint: "Aloqa uchun shaxs",
            ),
            const SizedBox(height: 10),
            CustomInput(
              size: size,
              textController: ownerEmailController,
              hint: "Email",
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            CustomInput(
              size: size,
              textController: ownerPhoneController,
              hint: "Aloqa uchun telfon raqam",
              textInputType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _titleField(width * 0.8, height, "Tekshirishga roziman"),
                CupertinoSwitch(
                  value: agreed,
                  onChanged: (value) {
                    setState(() {
                      agreed = value;
                    });
                  },
                  activeColor: StaticColors.kBlueButtonColor,
                  trackColor: const Color(0xff969696),
                ),
              ],
            ),
            const Text(
              "iPhone 10xs 64gb kumush sotiladi holati yaxshi. Men sotib\nolganimdek sotaman yangi telefon modeli.Ekrandagi oyna\nhech qachon origina",
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: StaticColors.kSubtitleColor,
              ),
            ),
            const Divider(
                color: Color(0xffE8E8E8), indent: 16, thickness: 1, height: 25),
            Row(
              children: [
                _titleField(
                    width * 0.8, height, "Stiker olishga zayavka qoldirish"),
                CupertinoSwitch(
                  value: sticker,
                  onChanged: (value) {
                    setState(() {
                      sticker = value;
                    });
                  },
                  activeColor: StaticColors.kBlueButtonColor,
                  trackColor: const Color(0xff969696),
                ),
              ],
            ),
            const Text(
              "iPhone 10xs 64gb kumush sotiladi holati yaxshi. Men sotib\nolganimdek sotaman yangi telefon modeli.Ekrandagi oyna\nhech qachon origina",
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: StaticColors.kSubtitleColor,
              ),
            ),
            const Divider(color: Color(0xffE8E8E8), indent: 16, thickness: 1),
            const SizedBox(height: 20),
            ButtonFields(() {
              widget.title == "Apple Bro bilan"
                  ? showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        content: Padding(
                          padding: const EdgeInsets.only(top: 28),
                          child: CircleAvatar(
                            backgroundColor:
                                const Color(0xff00C2FF).withOpacity(0.3),
                            radius: width * 0.1,
                            child: const Icon(
                              CupertinoIcons.phone,
                              color: Color(0xff020202),
                            ),
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 40),
                        actions: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            child: Text(
                              "Apple Bro tez orada siz\nbilan bog’lanadi",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff020202),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdsConditionPage(
                          "assets/images/iphone-background.png",
                          false,
                          "assets/icons/white-apple.svg",
                        ),
                      ),
                    );
            }, "Keyingisi"),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Expanded _phoneCondition(String name, String text) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            context.read<AdsProvider>().holati = name;
          });
        },
        child: Card(
          color: context.read<AdsProvider>().holati == name
              ? Colors.white
              : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: context.read<AdsProvider>().holati == name ? 1.5 : 0,
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

  SizedBox _titleField(double width, double height, String text) {
    return SizedBox(
      width: width,
      height: height * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
