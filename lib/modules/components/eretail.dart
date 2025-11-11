import 'package:bogo_home/core/constants/assets_path.dart';
import 'package:bogo_home/core/constants/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class eRetail extends StatelessWidget {
  const eRetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFB43CF0), // Pinkish-purple
              Color(0xFF2A4CF4), // Blue
              Color(0xFFB43CF0), // Pinkish-purple
            ],
            stops: [
              0.05,
              0.50,
              0.95,
            ],
          )
      ),
      child: Row(
        children: [
            SvgPicture.asset(
              homepageSvg.shoppingBag,
              color: ThemeColor.white,
              height: 14,
            ),
            Text(
              'eRetail',
              style: const TextStyle(
                height: 1,
                letterSpacing: 1.2,
                fontSize: 10,
                color: ThemeColor.white,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
