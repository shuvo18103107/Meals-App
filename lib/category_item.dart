import 'package:flutter/material.dart';
import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItem(
    this.id,
    this.title,
    this.color,
  );
  void selectCategory(BuildContext ctx) {
    // current page janbe widget tree er position vujbe context diye trpr er upor r ekta screen dekhabe as a stack ,in push we add page on the stack as a topmost page and in pop we remove that page, just in stack page switching
    Navigator.of(ctx).pushNamed('/category-meals',
        // arguments can anything , num,string,map,object anything...in our case we pass a map
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    // now we after get the data we use it in card a nice title and for card background the color
    return InkWell(
      // inkwell is the widget like kicu te ta korle ekta riple effect hoi ike a wave
      //here in ontap we can either pass a function reference or an anonymous function that will act as a callback.
      onTap: () => selectCategory(
          context), // annoyomous function use kore position ta pass korlam kothai navigation er position widget tree te
      splashColor: Theme.of(context).primaryColor,
      // should be same as the container borderradius for nicely follow the shape
      borderRadius: BorderRadius.circular(15),
      child: Container(
        // by using const i optimize the build process littelbit
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          // Theme.of(context) global theme access kore
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                // color ta grid e suru hobe ektu transparent vive niye then real color ta asbe
                color.withOpacity(0.5),
                color,
              ],
              // for direction of the color
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
