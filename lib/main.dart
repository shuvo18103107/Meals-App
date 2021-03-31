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
        '/': (_) => TabsScreen(),

        CategoryMealsScreen.routeName: (_) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (_) => MealDetailScreen(),
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
