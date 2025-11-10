import 'dart:ui';

import 'package:bogo_home/modules/services/home_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  final List<BannerInfo> banners;
  const BannerCarousel({required this.banners,Key? key}) : super(key: key);

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.banners.length,
        itemBuilder: (context, index, actualIndex){
          return CachedNetworkImage(
            placeholder: ,
            width: double.infinity,
            height: 1000,
            imageUrl: widget.banners![index].imageUrl,
            fit: BoxFit.cover,
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1,
          enableInfiniteScroll: true,
          autoPlayInterval: Duration(seconds: 5)
        ));
  }
}
