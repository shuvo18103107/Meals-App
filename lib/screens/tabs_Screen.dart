import 'package:flutter/material.dart';
import '../screens/favourite_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    //if tab on the top
    return DefaultTabController(
        initialIndex: 0,

        // how many tabs i want define by length , one is favourite and another one is all categories
        // defaultabcontroller and the tabbar are automatically connected by flutter behind the scene,so defaulttabcontroller can automatically detect which tab you are selecting and then show the write content for the tab

        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Meals'),
            // here we define tab bottom widget
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favourites',
                )
              ],
            ),
          ),
          body:
              // if i choose 1st tab then the first tab content will show in tabvarview ,vice versa

              TabBarView(
            children: [
              // note: order of the tab should be match with the order of tabverview children

              CategoriesScreen(), FavouriteScreen()
            ],
          ),
        ));
  }
}
