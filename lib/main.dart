import 'dart:ui';

import 'package:bogo_home/api_config.dart';
import 'package:bogo_home/core/constants/theme_colors.dart';
import 'package:bogo_home/modules/components/cardinfo_text.dart';
import 'package:bogo_home/modules/components/carousel.dart';
import 'package:bogo_home/modules/components/category.dart';
import 'package:bogo_home/modules/components/featured_group_deal.dart';
import 'package:bogo_home/modules/components/featured_stores.dart';
import 'package:bogo_home/modules/components/groupdeals_banner.dart';
import 'package:bogo_home/modules/components/hot_deals.dart';
import 'package:bogo_home/modules/components/large_card.dart';
import 'package:bogo_home/modules/components/nearbybrands.dart';
import 'package:bogo_home/modules/components/trending_deals.dart';
import 'package:bogo_home/modules/services/home_models.dart';
import 'package:bogo_home/modules/services/home_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        return MaterialApp(debugShowCheckedModeBanner: false, home: home());
      },
    ),
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
    banners = getdata();
    super.initState();
  }

  Future<List<BannerInfo>> getdata() async {
    final apiConfig = ApiConfig.loadFromAssets(
      'assets/configs/api_config.json',
    );
    final homeProvider = HomeProvider();
    await homeProvider.getHomeData(await apiConfig);

    return homeProvider.homeData!.banners;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: ThemeColor.primary,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardinfoText(text: "Good Morning, Eman",color: Colors.white,isMain: true,),
                CardinfoText(text: "10 10th commercial ln,zamzama commercial Area ",isUnderlined: true,color: Colors.white,size: 12,),
              ],

            ),

            leading: Icon(Icons.menu,color: Colors.white,),
            actions: [

            ],
          ),
          SliverToBoxAdapter(
            child: FutureBuilder<List<BannerInfo>>(
              future: banners,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                return BannerCarousel(banners: snapshot.data!);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: GroupDealss(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
                height: 102,
                child: Category()),
          ),

          SliverToBoxAdapter(
            child: TrendingDeals(),
          ),
          SliverToBoxAdapter(
            child: FeaturedStores(),
          ),
          SliverToBoxAdapter(
            child: HotDeals(),
          ),
          SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.only(left: 14,right: 14,top: 20),
              child: CachedNetworkImage(
                  imageUrl: 'https://firebasestorage.googleapis.com/v0/b/bogo-staging-11e83.appspot.com/o/banners%2Fbecome-a-member.png?alt=media'),
            ),
          ),
          SliverToBoxAdapter(
            child: Nearbybrands(),
          ),

        ],
      ),
    );
  }
}
