import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String catId;
  final String cattitle;
  CategoryMealsScreen(
    this.catId,
    this.cattitle,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(cattitle),
        ),
        body: Center(
          child: Text('The recipe for the category'),
        ));
  }
}
