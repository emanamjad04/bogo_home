import 'package:bogo_home/modules/services/home_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Categories> list= List.generate(10, (i){
      return Categories(id: i, name: 'categories$i',imageUrl:'assets/img.png' );
    });
    return ListView.builder(
    padding: EdgeInsets.all(5),
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
        itemBuilder: (context,index){
        final item = list[index];
        return Padding(padding: EdgeInsets.all(8),
        child: Column(
          children: [
            CircleAvatar(

              backgroundImage:AssetImage(item.imageUrl!),
            ),
            Container(
                width: 50,
                child: Text(item.name,
                style: TextStyle(
                  fontSize: 14
                ),
                textAlign: TextAlign.center,))
          ],
        ),);
        }
    );
  }
}
