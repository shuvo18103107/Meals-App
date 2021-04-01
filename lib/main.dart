import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meals.dart';
import './screens/filter_screen.dart';
import 'package:meals_app/screens/tabs_Screen.dart';
import './screens/category_meals_screen.dart';
import './screens/tabs_Screen.dart';
import './screens/meal_detail_screen.dart';
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // in filter screen by clicking any button the change will catch here, filtter screen pass data by refer a function and then we update here
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];
  void _setFilters(Map<String, bool> filterData) {
//update the map
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meals) {
        //  filter map e glutin true mane eita exclude korte hbe r 2nd condition like jodi glutenfree na hoi mane map e giya dekhlo false kora mane glutin ace taile excluded
        if (_filters['gluten'] && !meals.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meals.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meals.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meals.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }
//logic for adding and removing favourite
// this method recieve a id of meal and added it on favouritemealsList and also avoid duplication of meal in the list

  // by receiving the meal id i added it on the favourite meal list , if its already added then i removed it
  void _toogleFavourite(String mealId) {
    //it will give the index of certain element in the list , if it is not in the list index will be -1
    // if i find that mealid in the list then i remove it from the list
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    // search dibe id first e  pelei true return korbe
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          // background color of body of scafold
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          // default texttheme er upor override kore custom texttheme dilam
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      initialRoute: '/', //default is '/'
      // using route tabel
      routes: {
        // home page route  insttead of using home argument
        // as favouritescreen belongs to tabscreen so we give the list to tab screen so that we can pass it to favourite screen in the tabscreen
        '/': (_) => TabsScreen(_favouriteMeals),

        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (_) =>
            MealDetailScreen(_toogleFavourite, _isMealFavorite),
        FilterScreen.routeName: (_) => FilterScreen(_filters, _setFilters)
        // we can type this route name but drawback is we have to manually type this routename in pushNamed method so type e vul hole app break hote pare eta ekta jamela
        //builder function
      },
// rote tabel e kono requested route na pele  ongenerate route by defaulr kaj kore

      // when route generate dynamically we don't know in advanced that time we can use ongenerate route
      // onGenerateRoute: (setting) {
      //   print(setting.arguments);
      //   if(setting.name == '/meals-page')
      //   {
      //     // return // some another route
      //   }
      //   else if (setting.name=='/another-page')
      //   {
      //     // rerurn some other route page
      //   }
      //   return MaterialPageRoute(builder: (_) => CategoriesScreen());
      // });

// onknknown route
// when we defines nothing on ongenerate route and route tabel then onunknown route work, app crash er theke error er jonno ei route use kora better like 404 page
// onUnknownRoute: (setting)
// {
// return MaterialPageRoute(builder: (_) => CategoriesScreen());
// },
    );
  }
}
