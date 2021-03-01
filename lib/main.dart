import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (_) => CategoriesScreen(),

        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (_) => MealDetailScreen()
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
