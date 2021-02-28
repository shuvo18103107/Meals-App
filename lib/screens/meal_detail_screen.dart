import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meals-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('the Meal details page'),
      ),
      body: Center(
        child: Text('The meal- $routeArgs'),
      ),
    );
  }
}
