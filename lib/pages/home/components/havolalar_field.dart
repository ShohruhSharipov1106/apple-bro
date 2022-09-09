import 'package:apple_bro_test/constants/exports.dart';

class HavolalarField extends StatelessWidget {
  const HavolalarField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0, bottom: size.height * 0.05),
      child: Column(
        children: [
          TitleField(size: size, "Havolalar"),
          SizedBox(height: size.height * 0.01),
          SizedBox(
            height: size.height * 0.08,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff357AF6),
                      Color(0xffF635C0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: StaticColors.kActiveBorderColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
