import 'package:apple_bro_test/constants/exports.dart';
import 'package:apple_bro_test/pages/home/details/components/search_result.dart';
import 'package:flutter/cupertino.dart';

class MySearchDelegate extends SearchDelegate {
  List<String> searchResult = const [
    "Apple iPhone 12",
    "Apple 11 Pro",
    "Apple X",
    "Apple 13 Pro Max",
    "Apple 14 Pro Max"
  ];
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(CupertinoIcons.chevron_left),
        color: const Color(0xff8e8e93),
      );
  @override
  List<Widget>? buildActions(BuildContext context) => [
        TextButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: StaticColors.kActiveIconColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ];
  @override
  Widget buildResults(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SearchResult(size: size);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResult.where((searchResults) {
      return searchResults.toLowerCase().startsWith(query.toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            title: RichText(
              text: TextSpan(
                text: suggestion.substring(0, query.length),
                style: const TextStyle(
                  color: Color(0xff3C3C43),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: suggestion.substring(query.length),
                    style: const TextStyle(color: Color(0xff8D8D8D)),
                  ),
                ],
              ),
            ),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
            leading: const Icon(
              CupertinoIcons.search,
              color: Color(0xff8e8e93),
            ),
          );
        });
  }
}
