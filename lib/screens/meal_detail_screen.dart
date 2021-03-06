import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meals-detail';

  final Function toogleFavourite;
  final Function isFavourite;
  MealDetailScreen(this.toogleFavourite, this.isFavourite);

  // same functionaliuty just some changes then we can make separate widget and call it in the specific position
  // basically use for code duplication
  Widget buildsectiontitle(BuildContext ctx, String title) {
    // as it change the theme so context needed
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        // margin: EdgeInsets.only(top: 10),
        child: Text(
          title,
          style: Theme.of(ctx).textTheme.headline6,
        ));
  }

  Widget buildcontainer(Widget child) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    // firstwhere method take a argument and if matches the condition that returns that item
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                )),
            buildsectiontitle(context, 'Ingredients'),
            buildcontainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildsectiontitle(context, 'Steps'),
            buildcontainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(
                      color: Colors.brown,
                    )
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite(mealId) ? Icons.star : Icons.star_border),
        //reference dilei hbe na just argument pass kora lagbe tai
        onPressed: () => toogleFavourite(mealId),
        // by click this icon i want to go back so we can use navigator.pop
        //pop remove screen that are on the top of the stack things like dialog ,modalbottomshit we can use pop to remove those screens
        // so pop removes a screen , same as the back button by default when we use navigation push
        //popAndpushNamed ipop the current page and then push a new page
        // Navigator.of(context).pop(
        //     // so we can pass data when we poping any page ,it can be any data string,map,list,num ...

        //     mealId);
      ),
    );
  }
}
