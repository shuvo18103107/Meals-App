import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
// it is the property that can be access without initialize the  class
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  var _loadInitdata = false;

  //initstat automatic run before build run that means before widget created it called
  // in int stat we can use cof context related data cg its call too early before widget created so we can use didchangedependencies
  // void initState() {
  //   // extrac route argument and store it in a variable

  //   print(categoryMeals);
  //   super.initState();
  // }
  // However both of them are called before build is called. Only difference is that one is called before the state loads its dependencies and other is called a few moments after the state loads its dependencies.
  @override
  // bar bar didchangedependency r call korbe na first time e initialize hbe erpr setstat call korle just baki kaj er jonno build call hbe
  void didChangeDependencies() {
    // _loadedInitdata==false
//that means we hav not loaded initialize data yet
    if (_loadInitdata == false) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

// argument extract done
// now store passing value in a variable
// cattitle paowar por amra change korte parbo cg not final
      categoryTitle = routeArgs['title'];
      // catid paowar por r change korte parbo na cg final
      final categoryId = routeArgs['id'];

      categoryMeals = widget.availableMeals.where(
          //meals take each item as a input parameter and return a iterable list if satisfied the condition
          (meals) {
        return meals.categories.contains(categoryId);
      }).toList();

      _loadInitdata = true;
      super.didChangeDependencies();
    }
  }

  //pop call korar por page build howar somoi widget build er vitore access korle kaj hobe na tai initstat ei korte hobe

  void _removeitem(String mealId) {
    //id ta pele ekhn list theke remove korbo
    setState(() {
      categoryMeals.removeWhere((data) {
        return data.id == mealId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
              duration: categoryMeals[index].duration,
              removeItem: _removeitem,
            );
          },
          itemCount: categoryMeals.length,
          // cg category meals ekta list return kore jeta selected item er id er sathe meals list er jei id milbe sei meals gulai dekhabo listview te
        ));
  }
}
