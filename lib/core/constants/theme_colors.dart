import 'dart:ui';

import 'package:flutter/material.dart';

class ThemeColor {
  static const primary = Color(0xFFF27A21);
  static const onPrimary = Color(0xffB46F35);
  static const primaryV2 = Color(0xFF272859);
  static const lightPrimary = Color(0xFFFFF7EE);
  static const primaryLight = Color(0xFFFFDDC4);
  static const secondary = Color(0xFF000000);
  static const primaryShade = Color(0xFFFFEDDE);

  static const lightGrey = Color(0xFFAEAEAE);
  static const line = Color(0xFFE0DDDC);
  static const disable = Color(0xFF8B8B8B);
  static const fontBlack = Color(0xFF444444);


  static const white = Color(0xFFFFFFFF);
  static const surface = Color(0xFFF7F5F5);
  static const background = Color(0xFFF7F5F5);

  static const uptrend = Color(0xff4EAE7B);
  static const downtrend = Color(0xffF0704F);
  // static const sales = Color(0xffD5D5D5);
  static const sales = Color(0xff989898);
  static const reject = Color(0xffA13D3D);
  static const accept = Color(0xff335438);
  static const affiliation = Color(0xff3382A4);
  static const affiliationShade = Color(0xffCDF0FF);

  // todo: inputColor needs to be changed as per figma
  static const inputColor = Color(0xFFF0ECEB);
  // static const inputColor = Color(0xFFE9E3E1);
  static get highlight => primary.withOpacity(0.1);


  static const hint = Color(0xFFB2B2B2);
  static const error = Color(0xFFFA3D31);
  static const divider = Color(0xFFCECECE);
  static const referBlue = Color(0xFF3382A4);
  static const transparent = Colors.transparent;
  static const onPrimaryError = Color(0xFFFFF500);

  static const success = Color(0xFF17A357);
  static Color shimmerBaseColor = Colors.grey.shade300;
  static Color shimmerHighlightColor = Colors.grey.shade100;

  // static const inputColor = Color(0xFFE9E3E1);
  // static const categoryBG = Color(0xFFF0ECEB);

  /// gold membership color
  static const goldColor = Color(0xFFFFF5C4);
  /// classic membership color
  static const classicColor = Color(0xFFFFE4E4);
  /// silver membership color
  static const silverColor = Color(0xFFC8FFE1);
  /// gold membership text color
  static const goldTextColor = Color(0xFFB69F36);
  /// classic membership text color
  static const classicTextColor = Color(0xFFF56D6D);
  /// silver membership text color
  static const silverTextColor = Color(0xFF1A864C);


  /// membership colors
  static const goldMembership = Color(0xFF274514);
  static const visaMembership = Color(0xFF3CA598);
  static const classicMembership = Color(0xFF5E2D09);
  static const platinumMembership = Color(0xFF000000);

  // static const goldMembership = Color(0xFFB69F36);
  // static const visaMembership = Color(0xFF000000);
  // static const classicMembership = Color(0xFFF56D6D);
  // static const platinumMembership = Color(0xFF1A864C);

  /// membership shades
  static const goldMembershipShade = Color(0xFFFAE57C);
  static const visaMembershipShade = Color(0xFFC8FFF8);
  static const classicMembershipShade = Color(0xFFF49A57);
  static const platinumMembershipShade = Color(0xFFF3F3F3);

  // static const goldMembershipShade = Color(0xFFFFF5C4);
  // static const visaMembershipShade = Color(0xFFC8FFF8);
  // static const classicMembershipShade = Color(0xFFFFE4E4);
  // static const platinumMembershipShade = Color(0xFFC8FFE1);

  static const primaryGradient = [
    Color(0xFFF48029),
    Color(0xFFFFA663)
  ];
}