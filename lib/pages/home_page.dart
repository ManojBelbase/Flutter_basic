import 'package:blue_house/home_category.dart';
import 'package:blue_house/home_search.dart';
import 'package:blue_house/home_title.dart';
import 'package:blue_house/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // for Category section
  static List<Map<String, dynamic>> categories = [
    {"id": 1, "name": "All"},
    {"id": 2, "name": "Indoor"},
    {"id": 3, "name": "Outdoor"},
    {"id": 4, "name": "Aromatic"},
    {"id": 5, "name": "Succulent"}
  ];
  // List of Products
  List<ProductModel> products = [
    //product 1
    ProductModel(
        productName: "laptop",
        productImage:
            "https://scontent.fktm9-2.fna.fbcdn.net/v/t1.15752-9/387512536_1415791189361163_4977744959232811597_n.png?_nc_cat=103&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=9cYz9HYFXzQAX-6Oadu&_nc_ht=scontent.fktm9-2.fna&oh=03_AdRiZhqmtOXRQR-mp4DRA7bocyRGX-n_7OjkqCxvt3MkaA&oe=65AB3654",
        isFavourite: true,
        category: "Indoor",
        price: 99),
    //product 2
    ProductModel(
        productName: "mouse",
        productImage:
            "https://cdn.pixabay.com/photo/2014/09/24/14/29/macbook-459196_1280.jpg",
        isFavourite: false,
        category: "outdoor",
        price: 120),
    //product 3
    ProductModel(
        productName: "Laptop",
        productImage:
            "https://cdn.pixabay.com/photo/2016/10/12/13/32/office-1734485_1280.jpg",
        isFavourite: true,
        category: "fresh",
        price: 69),
    //product 4
    ProductModel(
        productName: "computer",
        productImage:
            "https://cdn.pixabay.com/photo/2015/01/08/18/24/children-593313_1280.jpg",
        isFavourite: false,
        category: "Indoor",
        price: 200),
    //product 5
    ProductModel(
        productName: "suntala",
        productImage:
            "https://cdn.pixabay.com/photo/2017/09/07/08/54/money-2724241_1280.jpg",
        isFavourite: true,
        category: "natural",
        price: 130),
  ];
  Map<String, dynamic> selectedCategory = categories.first;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // App Bar section
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // home title widget calling form widget 🫙conatner 1
            homeTitle(context),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            // 🫙Search bar section conatiner 2
            homeSearch(devicewidth, deviceHeight),
            SizedBox(
              height: 0.01 * deviceHeight,
            ),
            // 🫙category bar scrollable calling from homecategory page 🫙conatiner 3
            homeCategory(
                context: context,
                deviceHeight: deviceHeight,
                devicewidth: devicewidth,
                categories: categories,
                selectedCategory: selectedCategory,
                onClick: (Map<String, dynamic> category) {
                  setState(() {
                    selectedCategory = category;
                  });
                }),

            const SizedBox(height: 10),
            //
            // 🫙Scrooable conatiner including images and product description #🫙COntainer 4
            Container(
              height: deviceHeight * 0.31,
              // color: Colors.red,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      elevation: 2.0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                        margin: EdgeInsets.only(left: 5),
                        width: devicewidth * 0.42,
                        child: Column(children: [
                          Stack(
                            children: [
                              // Images 📸
                              Card(
                                color: Colors.red,
                                child: Container(
                                  height: deviceHeight * 0.16,
                                  // clipRRect helps to decorate image shape
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      products[index].productImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Icon(
                                  Icons.favorite,
                                  color: products[index].isFavourite
                                      ? Colors.red
                                      : Colors.white,
                                  size: 25,
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: Row(
                                children: [
                                  // Left side Products Descriptions😷
                                  Expanded(
                                    child: Container(
                                      height: double.maxFinite,
                                      // color: Colors.blue,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            products[index].category,
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            products[index].productName,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          Text(
                                            "Price",
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10),
                                          ),
                                          Text(
                                            "\$${products[index].price.toString()}",
                                            style: TextStyle(
                                                // color: Colors.grey[400],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  //  Add Icon➕  button
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
