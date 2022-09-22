import 'package:apple_bro_test/constants/exports.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ChangeLangButton extends StatefulWidget {
  String text;
  // ignore: prefer_typing_uninitialized_variables
  final function;
  int active;
  int current;
  ChangeLangButton(
    this.text,
    this.function,
    this.active,
    this.current, {
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ChangeLangButton> createState() => _ChangeLangButtonState();
}

class _ChangeLangButtonState extends State<ChangeLangButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.08,
      width: widget.size.width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
          const Spacer(),
          widget.active == widget.current
              ? const Icon(
                  CupertinoIcons.check_mark,
                  color: StaticColors.kBlueButtonColor,
                  size: 25.0,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
