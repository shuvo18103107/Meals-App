import 'package:flutter/foundation.dart';
// this foundation dart file unlock required decorator

// enum is a type like we can set couple of choices from ouroption
// behind the scene dart simply use 0,1,2 here, its map this value into normal int but as a developer we can read the label values
enum Complexity { Simple, Challenging, Hard }
enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  // one particular meal has many category like one meal can be German , Franch etc., also reason for map meals from categoriIds
  final List<String> categories;
  final String title;
  final String imageUrl;
  // which ingredients are need to prepare this meal ,we can make it more complex like not only ingredients also quantity and many more ..
  final List<String> ingredients;
  // the steps to prepare this meal
  final List<String> steps;
  // how long this meal will take to prepare
  final int duration;
  // we also need complixity of this meal like complixity ='simple' , but rather than string type we can use int like 0 for simple.. but we have to rememer this , and it is also not a good approach we can use enum
  // so we have choice among 3 option
  final Complexity complexity;
  final Affordability affordability;
  // the below property will be used for filtering
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}
