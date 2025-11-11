import 'package:bogo_home/api_config.dart';
import 'package:bogo_home/modules/components/carousel.dart';
import 'package:bogo_home/modules/services/home_models.dart';
import 'package:bogo_home/modules/services/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
      body:SmallCard(),);
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