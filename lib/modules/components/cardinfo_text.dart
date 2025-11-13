import 'package:bogo_home/core/constants/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardinfoText extends StatelessWidget {
  final String text;
  final bool isMain;
  final double? size;
  final FontWeight fontWeight;
  final double? letterspacing;
  final double height;
  final Color? color;
  final bool isUnderlined;
  final bool iselipse;
  const CardinfoText({this.iselipse=true,this.isUnderlined=false,this.color=ThemeColor.primaryV2,this.height=1.58,this.letterspacing,this.fontWeight=FontWeight.w400,required this.text, this.isMain=false,this.size=10,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: iselipse?TextOverflow.ellipsis:TextOverflow.visible,
      style: TextStyle(
        fontSize: isMain? 14:size,
        fontFamily: 'poppins',
        fontWeight: isMain? FontWeight.w500:fontWeight,
        color: color,
        letterSpacing: letterspacing,
        height: isMain?1:height,
        decoration: isUnderlined?TextDecoration.underline:TextDecoration.none,
        decorationColor: Colors.white
      ),
    );
  }
}
