import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../items/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding:const EdgeInsets.all(24),
      children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(catData.id,catData.title, catData.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        //it will depend on size of device as if it is 300 pixel we have only 1 item in row
        //whereas if its size is 500 pixel than 2 items side by side(500/200=2)
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      )
      //sliver is jsut scrollble area in flutter

      ,
    
    );
   
  }
}
