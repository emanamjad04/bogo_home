import 'package:bogo_home/modules/components/eretail.dart';
import 'package:bogo_home/modules/components/yellow_tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/assets_path.dart';
import '../../core/constants/theme_colors.dart';
import 'cardinfo_text.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(60),
      width: 160,
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
              Image.asset('assets/img.png',
              width: double.infinity,
              height: 129,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 10,
                  child: YellowTag(text: 'Top Brand')
              ),
              Positioned(
                left: 5.r,
                    bottom: 5.r,
                    child: eRetail()
              )

            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: Text('Del Frio',
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
                CardinfoText(text: '120 Km',size: 12,color: ThemeColor.fontBlack,),
                SizedBox(width: 12,),
                SvgPicture.asset(homepageSvg.food,color: ThemeColor.primary,
                ),
                SizedBox(width: 5,),
                CardinfoText(text: 'food',size: 12,color: ThemeColor.fontBlack,)
              ],
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9),
            child: CardinfoText(text: 'food',size: 10, fontWeight: FontWeight.w300,color: ThemeColor.primary,),
          )
        ],
      ),
    );
  }
}
