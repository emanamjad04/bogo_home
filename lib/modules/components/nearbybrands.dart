import 'package:bogo_home/modules/components/cardinfo_text.dart';
import 'package:bogo_home/modules/components/large_card.dart';
import 'package:bogo_home/modules/components/small_card.dart';
import 'package:bogo_home/modules/services/home_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Nearbybrands extends StatelessWidget {
  const Nearbybrands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BrandEntity> nearBybrands = List.generate(1, (i){
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardinfoText(text: 'Explore Nearest Brands',size: 18,fontWeight: FontWeight.w600,),
          ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,

            separatorBuilder: (BuildContext context,index)=>SizedBox(height: 10,),
            itemCount: nearBybrands.length,
            itemBuilder: (context, index){
              return CardLarge(obj: nearBybrands[index]);
            },
          )

        ],
      ),
    );
  }
}
