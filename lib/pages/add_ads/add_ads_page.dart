import 'package:apple_bro_test/constants/exports.dart';
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
  final TextEditingController tavsifController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController ownerNameController = TextEditingController();
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
                    color: Colors.green)),
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
                  return ListTile(
                    title: Text(
                      listTileTitles[index],
                      style: const TextStyle(
                        color: StaticColors.kBlackTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                      ),
                    ),
                    trailing: const Icon(CupertinoIcons.right_chevron),
                  );
                },
              ),
            ),
            const Divider(indent: 8.0, endIndent: 16.0),
            _titleField(width, height, "Holati"),
            ToggleButtons(
              selectedColor: Colors.green,
              disabledColor: Colors.red,
              isSelected: const [true, false],
              children: [
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  color: Colors.amber,
                ),
                Container(
                  height: height * 0.1,
                  width: width * 0.2,
                  color: Colors.amber,
                ),
              ],
            ),
            _titleField(width, height, "Tavsif"),
            CustomInput(
              size: size,
              textController: tavsifController,
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
                      textController: priceController,
                      hint: "15 000 000",
                      width: 0.74),
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
                              child: Text("uzs",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400))),
                          DropdownMenuItem(
                              value: "eu",
                              child: Text("ye.",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400))),
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
                textController: locationController,
                hint: " Yunusobod Tumani , Unversam bozori ...",
                preIcon: const Icon(CupertinoIcons.location_solid,
                    color: Color(0xff0071E3))),
            _titleField(width, height, "Aloqa uchun"),
            CustomInput(
                size: size,
                textController: ownerNameController,
                hint: "Aloqa uchun shaxs"),
            const SizedBox(height: 10),
            CustomInput(
                size: size,
                textController: ownerEmailController,
                hint: "Email"),
            const SizedBox(height: 10),
            CustomInput(
                size: size,
                textController: ownerPhoneController,
                hint: "Aloqa uchun telfon raqam"),
            const SizedBox(height: 10),
            switchField(
                width,
                height,
                "Tekshirishga roziman",
                "iPhone 10xs 64gb kumush sotiladi holati yaxshi. Men sotib\nolganimdek sotaman yangi telefon modeli.Ekrandagi oyna\nhech qachon origina",
                agreed),
            const Divider(
                color: Color(0xffE8E8E8), indent: 16, thickness: 1, height: 25),
            switchField(
                width,
                height,
                "Stiker olishga zayavka qoldirish",
                "iPhone 10xs 64gb kumush sotiladi holati yaxshi. Men sotib\nolganimdek sotaman yangi telefon modeli.Ekrandagi oyna\nhech qachon origina",
                sticker),
            const Divider(color: Color(0xffE8E8E8), indent: 16, thickness: 1),
            const SizedBox(height: 20),
            ButtonFields(() {}, "Keyingisi"),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Column switchField(
      double width, double height, String title, String subtitle, bool isTrue) {
    return Column(
      children: [
        Row(
          children: [
            _titleField(width * 0.8, height, title),
            CupertinoSwitch(
              value: isTrue,
              onChanged: (value) {
                setState(() {
                  isTrue = value;
                });
              },
              activeColor: StaticColors.kBlueButtonColor,
              trackColor: const Color(0xff969696),
            ),
          ],
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w400,
            color: StaticColors.kSubtitleColor,
          ),
        ),
      ],
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
