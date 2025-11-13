import 'package:bogo_home/modules/services/home_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cardinfo_text.dart';

class FeaturedStores extends StatelessWidget {
  const FeaturedStores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BrandEntity> list= List.generate(1, (i){
      return BrandEntity(
        id: 3564,
        name: "Toolsmart.pk",
        description: "ToolsMart.pk sells the best quality power tools and hand tools and general utility items.",
        shortDescription: null,
        isEretail: false,
        onMyWishlist: false,
        featuredOfferType: "flat",
        featuredOfferValue: 20,
        categoryNames: ["Retail"],
        contactNo: ["0331-6224453"],
        logoUrl: "https://i.imgur.com/vwN5IIY.png",
        placeholderText: [], // meta is empty, so no placeholder text
        tags: ["Retail", "Hardware", "Tools"],
        covers: [
          "https://d1o48iks0ndije.cloudfront.net/bogostage/entity/PKB-915.jpg"
        ],
        usePreGeneratedVouchers: false,
        isQrEnabled: false,
        isPinEnabled: true,
        isScanByPass: false,
        entityBranches: [
          EntityBranch(
            id: 12788,
            name: "Toolsmart.pk - Karachi",
            address: "http://www.toolsbazar.pk\n",
            contactNo: ["0331-6224453"],
            latitude: 24.8607,
            longitude: 67.0011,
            distance: 0,
            isEretail: false,
          ),
        ],
        entityTier: null,
        eretailUrl: null,
      );
    });
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16,top: 10,bottom: 10),
          child: CardinfoText(text: "Featured Stores",size: 18,fontWeight: FontWeight.w600,),
        ),
        SizedBox(
          height: 98,
          child: ListView.separated(
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context,index){
                final item = list[index];
                return Padding(padding: EdgeInsets.only(right: 8),
                  child: Column(
                    spacing: 8,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage:CachedNetworkImageProvider(
                          item.covers!.first,
                        ),
                      ),
                      Container(
                          width: 60,
                          child: CardinfoText(text: item.name,size: 14,iselipse: false,height: 1,)
                      )
                    ],
                  ),);
              }, separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10,)
          ),
        )
      ],
    );
  }
}
