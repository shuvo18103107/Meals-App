import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

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

    final categoryMeals = DUMMY_MEALS.where(
        //meals take each item as a input parameter and return a iterable list if satisfied the condition
        (meals) {
      return meals.categories.contains(categoryId);
    }).toList();
    print(categoryMeals);

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration);
          },
          itemCount: categoryMeals.length,
          // cg category meals ekta list return kore jeta selected item er id er sathe meals list er jei id milbe sei meals gulai dekhabo listview te
        ));
  }
}
