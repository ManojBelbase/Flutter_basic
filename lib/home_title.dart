import 'package:flutter/material.dart';

Widget homeTitle(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "Hello Best plants for\nour Green House",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      Stack(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                "https://imgs.search.brave.com/99m3ILzJDc0zktpcxxXqwDAUPNBfXSEAGZ-HNgv5tG4/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by93/aWRlLWFuZ2xlLXNo/b3Qtc2luZ2xlLXRy/ZWUtZ3Jvd2luZy1j/bG91ZGVkLXNreS1k/dXJpbmctc3Vuc2V0/LXN1cnJvdW5kZWQt/YnktZ3Jhc3NfMTgx/NjI0LTIyODA3Lmpw/Zz9zaXplPTYyNiZl/eHQ9anBn"),
          ),
          Positioned(
              right: 0,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      )
    ],
  );
}
