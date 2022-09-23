import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/provider/filter_provider.dart';

class FilterBody extends StatefulWidget {
  const FilterBody({Key? key}) : super(key: key);

  @override
  State<FilterBody> createState() => _FilterBodyState();
}

class _FilterBodyState extends State<FilterBody> {
  int _typeValue = -1;
  int _colorValue = -1;
  int _siklValue = -1;
  int _regionValue = -1;
  int _storageValue = -1;
  int _batteryValue = -1;
  bool enableReset = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                color: StaticColors.kBackgroundColor.withOpacity(0.94),
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.grey.shade200)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _typeValue = -1;
                        _colorValue = -1;
                        _siklValue = -1;
                        _regionValue = -1;
                        _storageValue = -1;
                        _batteryValue = -1;
                        enableReset = false;
                      });
                    },
                    child: Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: enableReset
                            ? StaticColors.kActiveIconColor
                            : const Color(0xff000000).withOpacity(0.3),
                      ),
                    ),
                  ),
                  const Text(
                    "Filter",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                  WillPopScope(
                    onWillPop: () {
                      return Future.value(false)
                          .whenComplete(() => setState(() {}));
                    },
                    child: TextButton(
                      onPressed: () {
                        context.read<FilterProvider>().type == null
                            ? null
                            : context
                                .read<FilterProvider>()
                                .filters
                                .add(context.read<FilterProvider>().type);
                        context.read<FilterProvider>().sikl == null
                            ? null
                            : context
                                .read<FilterProvider>()
                                .filters
                                .add(context.read<FilterProvider>().sikl);
                        context.read<FilterProvider>().region == null
                            ? null
                            : context
                                .read<FilterProvider>()
                                .filters
                                .add(context.read<FilterProvider>().region);
                        context.read<FilterProvider>().storage == null
                            ? null
                            : context
                                .read<FilterProvider>()
                                .filters
                                .add(context.read<FilterProvider>().storage);
                        context.read<FilterProvider>().battery == null
                            ? null
                            : context
                                .read<FilterProvider>()
                                .filters
                                .add(context.read<FilterProvider>().battery);
                        context.read<FilterProvider>().model == null
                            ? null
                            : context
                                .read<FilterProvider>()
                                .filters
                                .add(context.read<FilterProvider>().model);

                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Tasdiqlash",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff007AFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    _wrapMethod(context, _typeValue, "Mahsulot turi",
                        FilterProvider.types),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Rangi",
                          style: TextStyle(
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
                            FilterProvider.colors.length,
                            (int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _colorValue = index;
                                    enableReset = true;
                                    context.read<FilterProvider>().color =
                                        FilterProvider.colors[index];
                                  });
                                },
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundColor: _colorValue == index
                                          ? StaticColors.kActiveIconColor
                                          : const Color(0xff000A14)
                                              .withOpacity(0.2),
                                      child: CircleAvatar(
                                        radius: 24,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 22,
                                          backgroundColor:
                                              FilterProvider.colors[index],
                                        ),
                                      ),
                                    ),
                                    Text(
                                      FilterProvider.colorLabels[index],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff000A14),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                    _wrapMethod(
                        context, _siklValue, "Tsikli", FilterProvider.sikls),
                    _wrapMethod(
                        context, _regionValue, "Hudud", FilterProvider.regions),
                    _wrapMethod(context, _storageValue, "Xotirasi",
                        FilterProvider.storages),
                    _wrapMethod(context, _batteryValue, "Batareya",
                        FilterProvider.batteries),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _wrapMethod(
    BuildContext context,
    int value,
    String title,
    List labels,
  ) {
    final size = MediaQuery.of(context).size;
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
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
              labels.length,
              (int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      enableReset = true;
                      value = index;
                      switch (title) {
                        case "Mahsulot turi":
                          context.read<FilterProvider>().type = labels[index];
                          break;
                        case "Tsikli":
                          context.read<FilterProvider>().sikl = labels[index];
                          break;
                        case "Hudud":
                          context.read<FilterProvider>().region = labels[index];
                          break;
                        case "Xotirasi":
                          context.read<FilterProvider>().storage =
                              labels[index];
                          break;
                        case "Batareya":
                          context.read<FilterProvider>().battery =
                              labels[index];
                          break;
                        default:
                      }
                    });
                  },
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      color: value == index
                          ? StaticColors.kActiveIconColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: const Color(0xff000A14).withOpacity(0.2)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      labels[index],
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: value == index
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
    });
  }
}
