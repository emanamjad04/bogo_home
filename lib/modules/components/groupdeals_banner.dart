import 'package:bogo_home/core/constants/theme_colors.dart';
import 'package:bogo_home/modules/components/cardinfo_text.dart';
import 'package:bogo_home/modules/components/yellow_tag.dart';
import 'package:bogo_home/modules/services/home_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GroupdealsBanner extends StatelessWidget {
  final GroupDeal deal;
  final bool isMain;
  final double? width;
  const GroupdealsBanner({this.width,this.isMain=true,required this.deal,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                // color: Colors.pink,
                borderRadius: BorderRadius.circular(6)
            ),
            child: CachedNetworkImage(
              imageUrl: deal.imageUrl!,
            ),
          ),
          Positioned.fill(

            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              child: Column(
                spacing: 10,
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardinfoText(text: deal.title,fontWeight: FontWeight.w600,size: isMain?18:14,height: isMain?1.2:1.5,color: deal.color,),

                  isMain?YellowTag(text: " Enjoy lunch deals"):SizedBox.shrink()
                ],
              ),),
          )
        ],
      ),
    );
  }
}
