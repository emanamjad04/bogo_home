import 'dart:async';
import 'dart:ui';

import 'package:bogo_home/core/constants/assets_path.dart';
import 'package:bogo_home/modules/components/indicators.dart';
import 'package:bogo_home/modules/services/home_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BannerCarousel extends StatefulWidget {
  final List<BannerInfo> banners;
  const BannerCarousel({required this.banners, Key? key}) : super(key: key);

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  bool _isvisible = true;
  Timer? _debounce;
  void _onscoll() {
    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 200), visibility);
  }

  void visibility() {
    final RenderBox box = context.findRenderObject() as RenderBox;
    if (box == null || !box.hasSize) return;

    final height = box.size.height;
    final offset = box.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;

    final visible = (offset.dy + height > 0 && offset.dy < screenHeight * 0.8);
    if (_isvisible != visible) {
      setState(() {
        _isvisible = visible;
      });
    }
  }

  @override
  void initState() {
    // _scrollController.addListener(_onscoll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onscoll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: 0.56.sh,
            width: 1.sw,
            color: Colors.blue,
            child: CarouselSlider.builder(
              itemCount: widget.banners.length,
              itemBuilder: (context, index, actualIndex) {
                return CachedNetworkImage(
                  placeholder:
                      (context, url) => SvgPicture.asset(
                        placeholdersSvg.bannerPlaceholder,
                        fit:
                            BoxFit
                                .cover, // make placeholder also cover the space
                        width: double.infinity,
                        height: double.infinity,
                      ),
                  imageUrl: widget.banners[index].imageUrl,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover, // thi
                );
              },

              options: CarouselOptions(
                height: 0.56.sh,
                onPageChanged: (index, reason) {
                  _currentIndex.value = index;
                },
                autoPlay: _isvisible,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                autoPlayInterval: Duration(seconds: 5),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 14.h,
          left: 10,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.banners.length, (i) {
              return Indicators(currentIndex: _currentIndex, index: i);
            }),
          ),
        ),
      ],
    );
  }
}
