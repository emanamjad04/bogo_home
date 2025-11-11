import 'package:bogo_home/modules/components/eretail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/theme_colors.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      clipBehavior: Clip.hardEdge,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset('assets/img.png',
              width: 160,
              height: 129,
              ),
              Positioned(
                  child: Container(
                    padding:  EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color:ThemeColor.lightPrimary
                    ),
                    child: Text('Top Brand',style: TextStyle(
                      color: ThemeColor.primary
                    ),),
                  )
              ),
              Positioned(
                left: 5.r,
                    bottom: 5.r,
                    child: eRetail()
              )

            ],
          ),
          Text('Del Frio',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),).padding(horizontal: 9),

        ],
      ),
    );
  }
}
