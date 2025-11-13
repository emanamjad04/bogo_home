import 'dart:ui';

import 'package:bogo_home/core/constants/assets_path.dart';
import 'package:bogo_home/core/constants/theme_colors.dart';
import 'package:bogo_home/modules/components/cardinfo_text.dart';
import 'package:bogo_home/modules/components/cover.dart';
import 'package:bogo_home/modules/services/home_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardLarge extends StatelessWidget {
  final BrandEntity obj;
  const CardLarge({required this.obj,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
            right: 10,
            child:Icon(Icons.abc,color: ThemeColor.primary,)
        ),
        cover(),
        Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child:  Container(
            clipBehavior: Clip.hardEdge,
    decoration: const BoxDecoration(),
    child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(6),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(ImagePaths.blur 
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    // backgroundImage:CachedNetworkImageProvider(obj.),

                  ),
                  SizedBox(width: 6,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardinfoText(text: 'Store name ', isMain: true,),
                      SizedBox(height:3 ,),
                      Row(
                        children: [
                          SvgPicture.asset(homepageSvg.bicycle,color: ThemeColor.primaryV2,
                          ),
                          SizedBox(width: 5,),
                          CardinfoText(text: '120 Km',size: 12,),
                          SizedBox(width: 12,),
                          SvgPicture.asset(homepageSvg.food,color: ThemeColor.primaryV2,
                          ),
                          SizedBox(width: 5,),
                          CardinfoText(text: 'food',size: 12,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              CardinfoText(text: 'food',size: 10, fontWeight: FontWeight.w300,)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CardinfoText(text: 'Flat',size: 12,fontWeight: FontWeight.w700,height: 0.8,),
              Row(
                children: [
                  CardinfoText(text: '20',size: 50,fontWeight: FontWeight.w700,letterspacing: -4,height:1,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardinfoText(text: '%',size: 24,fontWeight: FontWeight.w700,height: 0.8,),
                      CardinfoText(text: 'off',size: 20,fontWeight: FontWeight.w700,height: 1,),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    ),
    ),
    ),)

      ],
    );
  }
}
