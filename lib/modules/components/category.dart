import 'package:bogo_home/modules/services/home_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Categories> list= List.generate(7, (i){
      return Categories(id: i, name: 'Food',imageUrl:'https://d1o48iks0ndije.cloudfront.net/category/food_1604916199108_223.png' );
    });
    return ListView.separated(

    padding: EdgeInsets.only(left: 16),
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
        itemBuilder: (context,index){
        final item = list[index];
        return Padding(padding: EdgeInsets.only(right: 8),
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage:CachedNetworkImageProvider(
                 item.imageUrl!,
              ),
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
        }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,)
    );
  }
}
