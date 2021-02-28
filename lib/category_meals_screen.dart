import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
// it is the property that can be access without initialize the  class
  static const routeName = '/category-meals';

  // final String catId;
  // final String cattitle;
  // CategoryMealsScreen(
  //   this.catId,
  //   this.cattitle,
  // );
// now how extract data in this screen though we pass data using name route argument .
  @override
  Widget build(BuildContext context) {
    // extrac route argument and store it in a variable
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

// argument extract done
// now store passing value in a variable
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {},
        ));
  }
}
