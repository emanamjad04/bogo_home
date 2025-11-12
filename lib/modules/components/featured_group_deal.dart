import 'package:bogo_home/core/constants/theme_colors.dart';
import 'package:bogo_home/modules/components/groupdeals_banner.dart';
import 'package:bogo_home/modules/components/yellow_tag.dart';
import 'package:bogo_home/modules/services/home_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cardinfo_text.dart';

class GroupDealss extends StatelessWidget {
  const GroupDealss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GroupDeal featuredGroupDeals =GroupDeal(id: 1, title: "Have you had your lunch?", subtitle: "Enjoy lunch deals, hideTitle", imageUrl: "https://d1o48iks0ndije.cloudfront.net/groupdeal/lunch%20resize%202.png", colorCode: "000000", innerBannerPhotoUrl: " https://d1o48iks0ndije.cloudfront.net/groupdeal/lunch%20big.webp", brandEntities: []);
    final List<GroupDeal> groupDeals =List.generate(5, (i)=>GroupDeal(id: i, title: "Fine Dine", imageUrl: "https://d1o48iks0ndije.cloudfront.net/groupdeal/fine%20dine.png", colorCode: "6C380E", brandEntities: [], innerBannerPhotoUrl: " https://d1o48iks0ndije.cloudfront.net/groupdeal/fine_dine_big.webp", subtitle: "Upto 20% flat off"));
    return Padding(
      padding: const EdgeInsets.only(top: 10.0,left: 14.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: GroupdealsBanner(deal: featuredGroupDeals,),
          ),

          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemCount: groupDeals.length,
                itemBuilder:(context,index){
                 return GroupdealsBanner(deal: groupDeals[index],isMain: false,width: 152,);
                },
              separatorBuilder: (BuildContext context, int index)=>SizedBox(width: 10,) ,
            ),
          )
        ],
      ),
    );
  }
}
