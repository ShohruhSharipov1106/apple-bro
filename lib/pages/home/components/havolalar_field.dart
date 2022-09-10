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
      padding: EdgeInsets.only(top: 25.0, bottom: size.height * 0.02),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.045),
            child: TitleField(size: size, "Havolalar"),
          ),
          SizedBox(height: size.height * 0.02),
          SizedBox(
            height: size.height * 0.08,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => DecoratedBox(
                decoration: const BoxDecoration(
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
                  padding: const EdgeInsets.all(1.5),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: size.height * 0.033,
                      backgroundColor: StaticColors.kActiveBorderColor,
                      backgroundImage: NetworkImage(
                          "https://source.unsplash.com/random/$index"),
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
