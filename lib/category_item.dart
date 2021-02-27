import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    // now we after get the data we use it in card a nice title and for card background the color
    return Container(
      // by using const i optimize the build process littelbit
      padding: const EdgeInsets.all(15),
      child: Text(title),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              // color ta grid e suru hobe ektu transparent vive niye then real color ta asbe
              color.withOpacity(0.7),
              color,
            ],
            // for direction of the color
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
