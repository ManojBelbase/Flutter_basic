import 'package:blue_house/home_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Map<String, dynamic>> categories = [
    {"id": 1, "name": "All"},
    {"id": 2, "name": "Indoor"},
    {"id": 3, "name": "Outdoor"},
    {"id": 4, "name": "Aromatic"},
    {"id": 5, "name": "Succulent"}
  ];
  Map<String, dynamic> selectedCategory = categories.first;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // home title widget calling form widget
            homeTitle(context),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            // Search bar section
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    elevation: 0,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: deviceHeight * 0.06,
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Search Plant",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16))
                        ],
                      ),
                      // width: 300,
                    ),
                  ),
                ),
                SizedBox(
                  width: devicewidth * 0.01,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  splashColor: Theme.of(context).primaryColor,
                  onPressed: () {},
                  child: Icon(
                    Icons.filter_alt_off_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            // floating selection
            SizedBox(height: 10),
            // category bar scrollable
            SizedBox(
              height: deviceHeight * 0.06,
              // color: Colors.red,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: categories
                      .map(
                        (category) => InkWell(
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                          child: Card(
                            color: category == selectedCategory
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            child: Container(
                              padding: EdgeInsets.symmetric(
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
            )
          ],
        ),
      ),
    );
  }
}
