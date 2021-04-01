import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouriteScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    // jehutu favourite screen r category sceen ekhn tabbar er controlle tai eta tavview e just content dekhabe alada kore scafold use kore appbar ba body er drkr nai
    if (favouriteMeals.isEmpty) {
      return Center(
          child: Text('You have no favourites yet - start adding some!'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            duration: favouriteMeals[index].duration,
          );
        },
        itemCount: favouriteMeals.length,
        // cg category meals ekta list return kore jeta selected item er id er sathe meals list er jei id milbe sei meals gulai dekhabo listview te
      );
    }
  }
}
