import 'package:bogo_home/modules/components/cover.dart';
import 'package:bogo_home/modules/components/eretail.dart';
import 'package:bogo_home/modules/components/yellow_tag.dart';
import 'package:bogo_home/modules/services/home_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/assets_path.dart';
import '../../core/constants/theme_colors.dart';
import 'cardinfo_text.dart';

class SmallCard extends StatelessWidget {
  final GroupDeal obj;
  const SmallCard({required this.obj,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brand =obj.brandEntities.first;
    return Container(
      width: 160,
      margin: EdgeInsets.only(bottom: 9),
      // clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.r),
        boxShadow: [
          const BoxShadow(
            color: ThemeColor.inputColor,
            blurRadius: 10,
            spreadRadius: 3,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
                child: Image.network(
                  brand.covers?.isNotEmpty == true ? brand.covers!.first : '',
                  width: double.infinity,
                  height: 129,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image_not_supported, size: 80),
                ),
              ),
              if(brand.placeholderText!.isNotEmpty)Positioned(
                top: 10,
                  child: YellowTag(text:brand.placeholderText!.first)
              ),
              if(brand.isEretail)
                 Positioned(
                left: 5.r,
                    bottom: 5.r,
                    child: eRetail()
              )

            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(brand.name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),),
          ),
          SizedBox(height:3 ,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Row(
              children: [
                SvgPicture.asset(homepageSvg.bicycle,color: ThemeColor.primary,
                ),
                SizedBox(width: 5,),
                CardinfoText(text:brand.distance.toString(),size: 12,color: ThemeColor.fontBlack,),
                SizedBox(width: 12,),
                SvgPicture.asset(homepageSvg.food,color: ThemeColor.primary,
                ),
                SizedBox(width: 5,),
                CardinfoText(text:brand.categoryNames![0],size: 12,color: ThemeColor.fontBlack,)
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: CardinfoText(text: brand.tags!.join(' • '),color: ThemeColor.primary,),
          )
        ],
      ),
    );
  }
}
