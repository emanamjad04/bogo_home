import 'package:bogo_home/modules/components/small_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../services/home_models.dart';
import 'cardinfo_text.dart';

class HotDeals extends StatelessWidget {
  const HotDeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<GroupDeal> hotDeals = List.generate(1, (i){
      return GroupDeal(
        id: 10,
        title: "Hot Deals",
        subtitle: "Get the hottest deals",
        imageUrl:
        "https://firebasestorage.googleapis.com/v0/b/bogo-staging-11e83.appspot.com/o/collections%2FCollection%20Ramzan.jpg?alt=media",
        innerBannerPhotoUrl:
        "https://d1o48iks0ndije.cloudfront.net/groupdeal/",
        colorCode: "000000",
        brandEntities: [
          BrandEntity(
            id: 7296,
            name: "Angeethi",
            shortDescription: "Redefining The BBQ Dining experience.",
            isEretail: false,
            logoUrl:
            "https://d1o48iks0ndije.cloudfront.net/bogostage/entity/Angeethi_1649922101482_2699.jpeg",
            tags: [
              "Appetizer",
              "BBQ",
              "Desi",
              "Fine Dine",
              "Pakistani",
            ],
            placeholderText: ["Popular"],
            covers: [
              "https://d1o48iks0ndije.cloudfront.net/bogostage/entity/2021%20-%20Angeethi%20-%20Merchant%20Cover_1619596060470_9776.jpg",
            ],
            categoryNames: ["Food"],
            onMyWishlist: false,
            entityBranches: [
              EntityBranch(
                id: 7971,
                name: "DHA",
                latitude: 24.81,
                longitude: 67.05,
                address:
                "Shop No 1 & 2 Plot 6-C, Main Shahbaz Commercial Area Shahbaz DHA Ph-06",
                distance: 7492.1505021524135,
                isEretail: false,
                contactNo: [],
              ),
            ],
            usePreGeneratedVouchers: false,
            isQrEnabled: false,
            isPinEnabled: true,
            isScanByPass: false,
            eretailUrl: null,
            featuredOfferValue: null,
            entityTier: null,
            featuredOfferType: null,
          ),
        ],
      );
    });
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16,top: 10),
          child: CardinfoText(text: hotDeals.first.title,size: 18,fontWeight: FontWeight.w600,),
        ),
        SizedBox(
          height: 0.27.sh,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 16,top: 10),
            separatorBuilder: (BuildContext context,index)=>SizedBox(width: 10,),
            itemCount: hotDeals.length,
            itemBuilder: (context, index){
              return SmallCard(
                obj: hotDeals[index],
              );
            },
          ),
        )

      ],
    );
  }
}
