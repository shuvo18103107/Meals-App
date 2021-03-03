import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactosFree = false;

  Widget _switchlistTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        //value just pass the data and update
        value: currentValue,
        subtitle: Text(subtitle),
        //the function need execute when user tabs this switch
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    // jehutu favourite screen r category sceen ekhn tabbar er controlle tai eta tavview e just content dekhabe alada kore scafold use kore appbar ba body er drkr nai
    return Scaffold(
        appBar: AppBar(
          title: Text('filter screen'),
        ),
        drawer: Maindrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              // as the list is not too long so i use listview not builder
              child: ListView(
                children: [
                  _switchlistTile('Gluten-free',
                      'Only include gluten free meals', _glutenFree, (ontap) {
                    setState(() {
                      _glutenFree = ontap;
                    });
                  }),
                  _switchlistTile('Lactos-free',
                      'Only include lactose free meals', _glutenFree, (ontap) {
                    setState(() {
                      _glutenFree = ontap;
                    });
                  }),
                  _switchlistTile('Vegetarian', 'Only include vegetarian meals',
                      _vegetarian, (ontap) {
                    setState(() {
                      _vegetarian = ontap;
                    });
                  }),
                  _switchlistTile('Vegan', 'Only include vegan meals', _vegan,
                      (ontap) {
                    setState(() {
                      _vegan = ontap;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
