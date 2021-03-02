import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter-screen';

  @override
  Widget build(BuildContext context) {
    // jehutu favourite screen r category sceen ekhn tabbar er controlle tai eta tavview e just content dekhabe alada kore scafold use kore appbar ba body er drkr nai
    return Scaffold(
        appBar: AppBar(
          title: Text('filter screen'),
        ),
        drawer: Maindrawer(),
        body: Center(
          child: Text('Filter screen'),
        ));
  }
}
