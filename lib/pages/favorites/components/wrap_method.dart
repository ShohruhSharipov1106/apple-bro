import 'package:apple_bro_test/constants/exports.dart';

// ignore: must_be_immutable
class WrapMethod extends StatefulWidget {
  WrapMethod(this._value, this.title, this.enableRst, this.provide,
      {required this.labels, super.key});
  int _value;
  String title;
  List<String> labels;
  bool enableRst;
  // ignore: prefer_typing_uninitialized_variables
  var provide;
  @override
  State<WrapMethod> createState() => _WrapMethodState();
}

class _WrapMethodState extends State<WrapMethod> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Color(0xff000A14),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List<Widget>.generate(
            widget.labels.length,
            (int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.enableRst = true;
                    widget._value = index;
                    widget.provide = widget.labels[index];
                  });
                },
                child: Container(
                  height: size.height * 0.05,
                  width: size.width * 0.4,
                  decoration: BoxDecoration(
                    color: widget._value == index
                        ? StaticColors.kActiveIconColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: const Color(0xff000A14).withOpacity(0.2)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.labels[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: widget._value == index
                          ? Colors.white
                          : const Color(0xff000A14),
                    ),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
