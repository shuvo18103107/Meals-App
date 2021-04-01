import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screens/favourite_screen.dart';
import '../screens/categories_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;
// now we get which item i tapped
  void _selectpage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(), 'title': 'Categories',
        // if want some action
        // 'action': FlatButton() in that way we can add dynamically
      },
      //cg widget stat er vitor call korte pari na cg eta stat e available na so initstat call kore dilam cg widget ekhane available , it calls before build call
      {
        'page': FavouriteScreen(widget.favouriteMeals),
        'title': 'Your Favourites'
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if we use tabbar on the bottom

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),

      // Adding drawer

      drawer: Drawer(child: Maindrawer()),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        // bottomnavigationbar e manually kaj koraite hobe which tab user select and the content also

        onTap:
            _selectpage, //in ontap flutter automatically gives the index and from this we understood which item is selected
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        //current kon item ta select kora ace tar ekta identification dorkar
        //currentindex tell bottomnavigationbar which tap is actually selected
        currentIndex: _selectedPageIndex,

        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              // change some style if we use shifting
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Category'),
          BottomNavigationBarItem(
              // change some style if we use shifting
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Favourites'),
        ],
      ),
    );
  }
}
