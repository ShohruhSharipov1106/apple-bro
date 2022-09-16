import 'package:apple_bro_test/constants/exports.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    Key? key,
    required this.size,
    required this.textController,
    this.height = 0.06,
    this.width = 0.93,
    required this.hint,
    this.preIcon,
    this.textAlignment = TextAlign.start,
    this.textInputType = TextInputType.name,
    this.maxLine = 1,
  }) : super(key: key);

  final Size size;
  final TextEditingController textController;
  final double height;
  final double width;
  final String hint;
  final Widget? preIcon;
  final TextAlign textAlignment;
  final TextInputType textInputType;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * height,
      width: size.width * width,
      decoration: BoxDecoration(
        color: StaticColors.kGreyBackColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: textController,
        keyboardType: textInputType,
        maxLines: maxLine,
        textAlignVertical: TextAlignVertical.center,
        textAlign: textAlignment,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 10, top: 10),
          focusedBorder:
              const UnderlineInputBorder(borderSide: BorderSide.none),
          hintText: hint,
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          prefixIcon: preIcon ?? const SizedBox(),
          prefixIconConstraints: BoxConstraints(
            maxWidth: preIcon == null ? 0 : 16,
            maxHeight: preIcon == null ? 0 : 16,
          ),
          hintStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Color(0xff8E8E93),
          ),
        ),
      ),
    );
  }
}
