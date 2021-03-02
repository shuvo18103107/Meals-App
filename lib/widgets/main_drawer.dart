import 'package:flutter/material.dart';
import '../screens/filter_screen.dart';

class Maindrawer extends StatelessWidget {
  Widget drawerItem(String title, IconData icon, Function tapHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: tapHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            //how the child of the container align inside into the container
            alignment:
                Alignment.centerLeft, //vertically center horizontally left
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  // by defaulr fontfamily Raleway is set so no need

                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          drawerItem('Meals', Icons.restaurant,
              () => Navigator.of(context).pushNamed('/')),
          drawerItem('Favourites', Icons.settings,
              () => Navigator.of(context).pushNamed(FilterScreen.routeName)),
        ],
      ),
    );
  }
}
