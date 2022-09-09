import 'package:apple_bro_test/constants/exports.dart';

// ignore: must_be_immutable
class InputFields extends StatelessWidget {
  String title;
  TextEditingController textEditingController;
  String hintText;
  TextInputType textInputType;
  int maxLen;
  bool hasEye;

  InputFields(this.title, this.textEditingController, this.hintText,
      this.textInputType, this.maxLen,
      {this.hasEye = false, super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.13,
      width: size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 16.0,
                color: StaticColors.kBlackTextColor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: size.height * 0.02),
          TextFormField(
            keyboardType: textInputType,
            controller: textEditingController,
            validator: (value) {
              if (textEditingController.text.length < maxLen) {
                return "";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: StaticColors.kActiveBorderColor)),
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                  fontSize: 16.0, fontWeight: FontWeight.w400),
              suffixIcon: GestureDetector(
                // add function
                onTap: () {},
                child: !hasEye
                    ? const SizedBox()
                    : const Icon(
                        Icons.remove_red_eye_rounded,
                        color: StaticColors.kBlackTextColor,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
