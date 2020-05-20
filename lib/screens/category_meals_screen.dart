import 'package:flutter/material.dart';
import '../items/meal-item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  //  final String categoryID;
  //   final String categoryTitle;
  //   CategoryMealsScreen(this.categoryID, this.categoryTitle);
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitdata = false;
  @override
  void initState() {
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_loadedInitdata == false) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      //this will help us to take argements passeed by us in the pushNamed() in category item file and use them easily
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
        //contains return true if this id is found
      }).toList();
      _loadedInitdata = true;
    }
 super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
      //removeWhere will remove all items which staisfy the specific condn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
