import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/favorites/components/wrap_method.dart';
import 'package:apple_bro_test/pages/favorites/favorites_page.dart';
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
    final read = context.read<FilterProvider>();
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
              padding: const  EdgeInsets.symmetric(horizontal: 16),
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
                  TextButton(
                    onPressed: () {
                      context.read<FilterProvider>().type == null
                          ? null
                          : filters.add(context.read<FilterProvider>().type);
                      context.read<FilterProvider>().sikl == null
                          ? null
                          : filters.add(context.read<FilterProvider>().sikl);
                      context.read<FilterProvider>().region == null
                          ? null
                          : filters.add(context.read<FilterProvider>().region);
                      context.read<FilterProvider>().storage == null
                          ? null
                          : filters.add(context.read<FilterProvider>().storage);
                      context.read<FilterProvider>().battery == null
                          ? null
                          : filters.add(context.read<FilterProvider>().battery);
                      context.read<FilterProvider>().model == null
                          ? null
                          : filters.add(context.read<FilterProvider>().model);
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
                    WrapMethod(
                        _typeValue, "Mahsulot turi", enableReset, read.type,
                        labels: FilterProvider.types),
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
                    WrapMethod(_siklValue, "Tsikli", enableReset, read.sikl,
                        labels: FilterProvider.sikls),
                    WrapMethod(_regionValue, "Hudud", enableReset, read.region,
                        labels: FilterProvider.regions),
                    WrapMethod(
                        _storageValue, "Xotirasi", enableReset, read.storage,
                        labels: FilterProvider.storages),
                    WrapMethod(
                        _batteryValue, "Batareya", enableReset, read.battery,
                        labels: FilterProvider.batteries),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
