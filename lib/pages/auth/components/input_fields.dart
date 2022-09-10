import 'package:apple_bro_test/constants/exports.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class InputFields extends StatefulWidget {
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
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  bool visible = false;

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
            widget.title,
            style: GoogleFonts.inter(
                fontSize: 16.0,
                color: StaticColors.kBlackTextColor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: size.height * 0.01),
          TextFormField(
            keyboardType: widget.textInputType,
            controller: widget.textEditingController,
            validator: (value) {
              if (widget.textEditingController.text.length < widget.maxLen) {
                return "";
              } else {
                return null;
              }
            },
            obscureText: visible,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: StaticColors.kActiveBorderColor)),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.inter(
                  fontSize: 16.0, fontWeight: FontWeight.w400),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child: !widget.hasEye
                    ? const SizedBox()
                    : Icon(
                        !visible
                            ? CupertinoIcons.eye_slash
                            : CupertinoIcons.eye_fill,
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
