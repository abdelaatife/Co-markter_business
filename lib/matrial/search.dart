import 'package:flutter/material.dart';
import 'package:soultion/Data/data.dart';


class DataSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('$query');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filter = itemsearch
        .where((element) => element.contains(query))
        .toList(); //or contains
    return ListView.builder(
        itemCount: query == '' ? itemsearch.length : filter.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              query = query == '' ? itemsearch[i] : filter[i];
              showResults(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(19),
              child: query == ''
                  ? Text('${itemsearch[i]}')
                  : Text('${filter[i]} '),
            ),
          );
        });
  }
}
