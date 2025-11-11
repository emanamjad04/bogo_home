import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Indicators extends StatelessWidget {
  final ValueNotifier<int> currentIndex;
  final int index;
  const Indicators({required this.currentIndex, required this.index, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      // key: ValueKey(index),
      valueListenable: currentIndex,
      builder: (BuildContext context, int value, Widget? child) {
        final isActive = index == value;
        return AnimatedContainer(
          key: ValueKey(value),
          margin: EdgeInsets.all(2.w),
          duration: Duration(milliseconds: 300),
          width: isActive ? 28.w : 8.w,
          height: 8.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isActive ? Colors.orange : Colors.grey,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(2.w),
        width: 8.w,
        height: 8.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey,
        ),
      ),
    );
  }
}
