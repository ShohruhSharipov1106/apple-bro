import 'package:apple_bro_test/constants/exports.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class ProfileListTile extends StatelessWidget {
  String title;
  final page;
  String summa;
  bool hasPre;
  bool hasTrailing;
  ProfileListTile(this.title, this.page,
      {this.hasPre = false,
      this.hasTrailing = false,
      this.summa = "1 500 000",
      super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
      child: Container(
        height: size.height * 0.06,
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: const Color(0xff000A14).withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            hasPre
                ? const Icon(
                    Icons.logout,
                    color: Color(0xffFB4E4E),
                    size: 25.0,
                  )
                : const SizedBox(),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xff000A14),
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
            ),
            const Spacer(),
            hasTrailing
                ? Text(
                    summa,
                    style: const TextStyle(
                      color: Color(0xff3D69FB),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(width: 4),
            const Icon(
              CupertinoIcons.right_chevron,
              color: Color(0xff8E8E93),
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
