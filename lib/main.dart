import 'package:bogo_home/api_config.dart';
import 'package:bogo_home/modules/components/carousel.dart';
import 'package:bogo_home/modules/components/featured_group_deal.dart';
import 'package:bogo_home/modules/components/groupdeals_banner.dart';
import 'package:bogo_home/modules/components/large_card.dart';
import 'package:bogo_home/modules/services/home_models.dart';
import 'package:bogo_home/modules/services/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'core/constants/assets_path.dart';
import 'modules/components/small_card.dart';
import 'modules/services/home_networking.dart';

void main() {
  runApp(
      ScreenUtilInit(
      designSize: Size(375, 812),
  builder: (context, child) {
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: home(),
  );}
      )
  );
}
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Future<List<BannerInfo>> banners;

  @override
  void initState() {
    banners=getdata();
    super.initState();
  }

  Future<List<BannerInfo>> getdata() async{
    final apiConfig =  ApiConfig.loadFromAssets('assets/configs/api_config.json');
    final homeProvider = HomeProvider();
    await homeProvider.getHomeData(await apiConfig);

   return homeProvider.homeData!.banners;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:GroupDealss(),
    );
  }
}
// CustomScrollView(
// slivers:[
// SliverToBoxAdapter(
// child: FutureBuilder<List<BannerInfo>>(
// future: banners,
// builder: (context, snapshot) {
// if (!snapshot.hasData) {
// return const Center(child: CircularProgressIndicator());
// }
// return BannerCarousel(banners: snapshot.data!);
// },
// ),
//
// )
// ]
// )