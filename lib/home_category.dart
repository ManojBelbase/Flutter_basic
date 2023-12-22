import 'package:flutter/material.dart';

Widget homeCategory(
    {required BuildContext context,
    required double deviceHeight,
    required double devicewidth,
    required List<Map<String, dynamic>> categories,
    required Map<String, dynamic> selectedCategory,
    required Function onClick}) {
  return SizedBox(
    height: deviceHeight * 0.06,
    // color: Colors.red,
    child: ListView(
        scrollDirection: Axis.horizontal,
        children: categories
            .map(
              (category) => InkWell(
                onTap: () {
                  onClick(category);
                  // setState(() {
                  //   selectedCategory = category;
                  // });
                },
                child: Card(
                  color: category == selectedCategory
                      ? Theme.of(context).primaryColor
                      : Colors.white,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Text(
                      category['name'],
                      style: TextStyle(
                          color: category == selectedCategory
                              ? Colors.white
                              : Colors.grey[600]),
                    ),
                  ),
                ),
              ),
            )
            .toList()),
  );
}
