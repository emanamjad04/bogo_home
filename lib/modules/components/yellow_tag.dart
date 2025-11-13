import '../../core/constants/theme_colors.dart';
import 'package:flutter/material.dart';
class YellowTag extends StatelessWidget {
  final text;
  const YellowTag({required this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:  EdgeInsets.symmetric(
        vertical: 1,
        horizontal: 4,
    ),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(topRight: Radius.circular(4),bottomRight: Radius.circular(4)),
    color:ThemeColor.lightPrimary
    ),
    child: Text(text,style: TextStyle(
    color: ThemeColor.primary
    ),));
  }
}
