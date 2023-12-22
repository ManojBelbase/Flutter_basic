import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget homeSearch(double devicewidth, double deviceHeight) {
  return Row(
    children: [
      Expanded(
        child: Card(
          elevation: 0,
          child: Container(
            alignment: Alignment.centerLeft,
            height: deviceHeight * 0.06,
            padding: EdgeInsets.only(left: 10),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(
                  width: 5,
                ),
                Text("Search Plant",
                    style: TextStyle(color: Colors.grey, fontSize: 16))
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
        // splashColor: Theme.of(context).primaryColor,
        onPressed: () {},
        child: Icon(
          Icons.filter_alt_off_outlined,
          color: Colors.white,
        ),
      )
    ],
  );
}
