import 'package:apple_bro_test/constants/exports.dart';

class BrendlarField extends StatelessWidget {
  const BrendlarField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10.0, bottom: size.height * 0.05, right: size.width * 0.05),
      child: Column(
        children: [
          TitleField(size: size, "Brendlar"),
          SizedBox(height: size.height * 0.01),
          SizedBox(
            height: size.height * 0.1,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.25),
                      blurRadius: 2,
                      spreadRadius: 2,
                      offset: Offset(-2, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  "assets/icons/white-apple.svg",
                  color: StaticColors.kBlackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
