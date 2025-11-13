import 'dart:ui';

class BannerInfo {
  final int id;
  final int order;
  final String imageUrl;
  final String? action, webviewTitle;

  BannerInfo({
    required this.id,
    required this.order,
    required this.action,
    required this.imageUrl,
    required this.webviewTitle,
  });
  factory BannerInfo.fromJson(Map<String, dynamic> json) => BannerInfo(
    id: json['id'],
    order: json['order'],
    imageUrl: json['imageUrl'],
    webviewTitle: json['webviewTitle'],
    action: json['action'] ?? json['actionUrl'],
  );
}
class Categories{
  final int id;
  final String name;
  final String? imageUrl;
  Categories({required this.id,required this.name, this.imageUrl});

  factory Categories.fromJson(Map<String,dynamic> json)=>Categories(id: json['id'], name: json['name'],imageUrl: json['imageUrl']??'');
}

// enum FeaturedOfferType { b1g1, flat, none }

class BrandEntity{

  int id;
  String name;
  String? slug;
  String? description;
  String? shortDescription;

  List<String>? contactNo;
  bool onMyWishlist;
  String? logoUrl;
  List<String>?  placeholderText;
  List<String>? tags;
  List<String>? covers;
  List<String>? redeemableMediums;
  List<String>? categoryNames;

  List<EntityBranch>? _entityBranches;

  bool usePreGeneratedVouchers;

  bool isScanByPass, isQrEnabled, isPinEnabled;

  String? entityTier;
  int? featuredOfferValue;
  String? featuredOfferType;

  String? eretailUrl;
  final bool isEretail;

  // OfferRedemptionType redemptionType;

  BrandEntity({
    required this.id,
    required this.name,
    this.slug,
    this.eretailUrl,
    this.description,
    this.shortDescription,
    this.contactNo,
    this.logoUrl,
    this.placeholderText,
    this.tags,
    this.covers,
    this.redeemableMediums,
    this.categoryNames,
    this.onMyWishlist = false,
    this.usePreGeneratedVouchers = false,
    this.isQrEnabled = false,
    this.isPinEnabled = true,
    this.isScanByPass = false,
    List<EntityBranch>? entityBranches,
    this.featuredOfferValue,
    this.entityTier,
    this.isEretail = false,
    this.featuredOfferType,
    // this.redemptionType = OfferRedemptionType.qr,
  }) {
    _entityBranches = entityBranches;
  }

  factory BrandEntity.fromJson(Map<String, dynamic> json) {

    return BrandEntity(
      id: json["id"],
      name: json["name"] ?? '-',
      slug: json["slug"] ?? '-',

      description: json["description"] ?? '-',
      isQrEnabled: json['isQrEnabled'].toString().toLowerCase() =='true',
      isScanByPass: json['bypassQRScan'].toString().toLowerCase() =='true',
      isPinEnabled: json['isPinEnabled'].toString().toLowerCase() =='true',
      shortDescription: json["shortDescription"] ?? '-',
      tags: (json["tags"] as List<dynamic>?)?.map((x) => x as String).toList(),
      contactNo: (json["contactNo"] as List<dynamic>?)?.map((x) => x as String)
          .toList(),
      onMyWishlist: json["onMyWishlist"] ?? false,
      logoUrl: json["logoUrl"],
      placeholderText:_parsePlaceholderText(json["meta"]),
      usePreGeneratedVouchers: json['usePreGeneratedVouchers'].toString().toLowerCase() =='true',

      covers: (json["richContents"]?["cover"] as List<dynamic>?)
          ?.map((x) => x["url"] as String)
          .toList(),
      redeemableMediums:
      (json["redeemableMediums"] as List<dynamic>?)
          ?.map((x) => x as String)
          .toList(),
      categoryNames: (json["categoryName"] as List<dynamic>?)?.map((
          x) => x as String).toList(),
      entityBranches: (json["entityBranches"] as List<dynamic>?)
          ?.map((x) => EntityBranch.fromJson(x as Map<String, dynamic>))
          .toList(),

      // new field
      eretailUrl: json['eretailUrl'],
      entityTier: json['entityTier'],
      isEretail: json["isEretail"] ?? false,
      featuredOfferValue: json['featuredOfferValue'],
      featuredOfferType: json['featuredOfferType'] ?? 'none',
    );
  }

  String get distance => branches?.first.formatDistance ?? '';
  List<EntityBranch>? get branches {
    if(_entityBranches==null) return null;

    List<EntityBranch> branches =List.from(_entityBranches!);
    branches.sort((a, b) {
      if (a.distance == null && b.distance == null) {
        return 0; // Both are null, no change in order
      }
      if (a.distance == null) {
        return 1; // Null distance goes to the end
      }
      if (b.distance == null) {
        return -1; // Null distance goes to the end
      }
      return a.distance!.compareTo(b.distance!); // Compare distances
    });

    return branches;
  }
  static List<String>? _parsePlaceholderText(dynamic meta) {
    if (meta == null) return null;
    if (meta is List) {
      return meta.map((e) => e.toString()).toList();
    } else if (meta is Map && meta["placeholderText"] != null) {
      return [meta["placeholderText"].toString()];
    }
    return null;
  }

}
class EntityBranch {
  int id;
  String name;
  bool isEretail;
  String address;
  double? latitude;
  double? longitude;
  double? distance;
  List<String>? contactNo;

  EntityBranch({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.distance,
     this.isEretail=false,
    required this.longitude,
     this.contactNo,
  });

  factory EntityBranch.fromJson(Map<String, dynamic> json) => EntityBranch(
    id: json["id"],
    name: json["name"] ?? '-',
    address: json["address"] ?? '-',
    isEretail: json["isEretail"] ?? false,
    // latitude: json["latitude"].toDouble(),
    // longitude: json["longitude"].toDouble(),
    distance: _parseDistance(json["distance"]),
    latitude: double.tryParse(json["latitude"].toString()),
    longitude: double.tryParse(json["longitude"].toString()),
    //(json["distance"] as int?)?.toDouble(),
    // contactNo: List<String>.from(json["contactNo"]?.map((x) => x)),
    contactNo: (json["contactNo"] as List<dynamic>?)?.map((x) => x as String).toList() ?? [],
  );


  static double? _parseDistance(value) {
    return value != null
        ? (value is int)
        ? (value).toDouble()
        : (value as double)
        : null;
  }

  String? get formatDistance {
    if (distance == null) return null;

    if (distance! >= 1000) {
      final distanceInKilometers = distance! / 1000;
      return '${distanceInKilometers.toStringAsFixed(0)} km';
    } else {
      return '${distance?.toStringAsFixed(0)} m';
    }
  }
}


class GroupDeal {
  final int id;
  final String title;
  // final double? height;
  final bool? hideTitle;
  final String subtitle;
  final String? imageUrl;
  final String colorCode;
  List<BrandEntity> brandEntities;
  final String? innerBannerPhotoUrl;

  GroupDeal({
    required this.id,
    required this.title,
    // required this.height,
    required this.subtitle,
     this.hideTitle,
    required this.imageUrl,
    required this.colorCode,
    required this.brandEntities,
    required this.innerBannerPhotoUrl,
  });

  factory GroupDeal.fromJson(Map<String, dynamic> json) => GroupDeal(
    id: json['id'] as int,
    // height: 70 ?? json['height'],
    title: json['name'] ?? '',
    subtitle: json['subtitle'] ?? '',
    hideTitle: json['hideTitle'].toString().toLowerCase() =='true',
    imageUrl: json['photoUrl'] as String?,
    colorCode: json['fontColor'] as String,
    innerBannerPhotoUrl: json['innerBannerPhotoUrl'] as String?,
    // brandEntities: (json['groupDealEntities'] as List<dynamic>?)?.map((e)=> BrandEntity.fromJson(e)).toList()??[]
    brandEntities: json.containsKey('groupDealEntities')
                ? List.from(json['groupDealEntities'].map((x) => BrandEntity.fromJson(x)))
                : [],
  );

  Color get color {
    final code = int.parse('0xff$colorCode');
    return Color(code);
  }
}

class HomeData {
  final List<BannerInfo> banners;
  final GroupDeal? featureGroupDeals;
  final List<GroupDeal> groupDeals;
  final List<Categories> categories;
  final List<BrandEntity> TrendyDeals;
  final List<BrandEntity> hotDeals;
  final List<BrandEntity> featureBrands;
  final List<BrandEntity> nearbyBrands;
  HomeData({required this.banners,
    this.featureGroupDeals,
      required this.groupDeals,
      required this.categories,
      required this.TrendyDeals,
    required this.hotDeals,
  required this.featureBrands, required this.nearbyBrands
  });

  factory HomeData.fromMap(Map<String,dynamic> json){
    return HomeData(
        banners:(json['banners'] as List? ?? [])
            .map((e) => BannerInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        featureGroupDeals: (json['featuredGroupDeal'] != null)
            ? GroupDeal.fromJson(json['featuredGroupDeal'])
            : null,
        groupDeals:(json['groupDeals'] as List? ?? [])
            .map((e) => GroupDeal.fromJson(e as Map<String, dynamic>))
            .toList(),
        categories: (json['categories'] as List? ?? [])
            .map((e) => Categories.fromJson(e as Map<String, dynamic>))
            .toList(),
        TrendyDeals:(json['trendingDeals'] as List? ?? [])
            .map((e) => BrandEntity.fromJson(e as Map<String, dynamic>))
            .toList(),
        featureBrands: (json['featuredBrands'] as List? ?? [])
            .map((e) => BrandEntity.fromJson(e as Map<String, dynamic>))
            .toList(),
        nearbyBrands:  (json['nearbyBrands'] as List? ?? [])
            .map((e) => BrandEntity.fromJson(e as Map<String, dynamic>))
            .toList(),
        hotDeals:(json['hotDeals'] as List? ?? [])
            .map((e) => BrandEntity.fromJson(e as Map<String, dynamic>))
            .toList(),
    );
  }
}