import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DeliMeal'),
        ),
        body: GridView(
            padding: EdgeInsets.all(25),

            // silvers are scrollable area in the screen so grid is also scrollable as default , delegate take care of structure of the grid,maxcrosaxisextend provides maximum width of each item
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                // device size jodi 300px hoi taile per row 1 ta kore tile bosbee like listview
                maxCrossAxisExtent: 200,
                // how the item should be size regarding their height and width
                childAspectRatio: 3 / 2, // 200 width with 300 hundred height
                // yhow much space is take each grid from row and column
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            // now lets take list of list item and turn into  widget
            children: DUMMY_CATEGORIES
                .map(
                    // this function is execute on every item in the list and shoul return a widget on every categoryitem on the list
                    (catData) =>
                        CategoryItem(catData.id, catData.title, catData.color))
                .toList()));
  }
}
