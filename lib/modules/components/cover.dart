import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class cover extends StatelessWidget {
  const cover({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://www.creativefabrica.com/wp-content/uploads/2023/09/03/Restaurant-Background-Graphics-78429994-1.jpg';
    final provider = CachedNetworkImageProvider(imageUrl);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(topRight:Radius.circular(7),topLeft: Radius.circular(7)),
          child: Image(
              image: provider, fit: BoxFit.cover,
              height: 172,
              width: double.infinity
          ),
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationX(3.14),
          child: ClipRRect(
            borderRadius: BorderRadius.only(topRight:Radius.circular(7),topLeft: Radius.circular(7)),
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 70/172,
              child: Image(
                  image: provider, fit: BoxFit.cover,
                  height: 172,
                  width: double.infinity
              ),
            ),
          ),
        ),
      ],
    );
  }
}