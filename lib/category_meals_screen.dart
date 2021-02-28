import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
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
        body: Center(
          child: Text('The recipe for the category'),
        ));
  }
}
