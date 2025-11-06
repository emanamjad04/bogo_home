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
//
// class GroupDeal {
//   final int id;
//   final String title;
//   // final double? height;
//   final bool hideTitle;
//   final String subtitle;
//   final String? imageUrl;
//   final String colorCode;
//   List<BrandEntity> brandEntities;
//   final String? innerBannerPhotoUrl;
//
//   GroupDeal({
//     required this.id,
//     required this.title,
//     // required this.height,
//     required this.subtitle,
//     required this.hideTitle,
//     required this.imageUrl,
//     required this.colorCode,
//     required this.brandEntities,
//     required this.innerBannerPhotoUrl,
//   });
//
//   factory GroupDeal.fromJson(Map<String, dynamic> json) => GroupDeal(
//     id: json['id'] as int,
//     // height: 70 ?? json['height'],
//     title: json['name'] ?? '',
//     subtitle: json['subtitle'] ?? '',
//     hideTitle: json.getBool('hideTitle'),
//     // hideTitle: json['hideTitle'] ?? false,
//     imageUrl: json['photoUrl'] as String?,
//     colorCode: json['fontColor'] as String,
//     innerBannerPhotoUrl: json['innerBannerPhotoUrl'] as String?,
//     brandEntities: json.containsKey('groupDealEntities')
//         ? List.from(json['groupDealEntities'].map((x) => BrandEntity.fromJson(x)))
//         : [],
//   );
//
//
// }
//
// class BogoCategory {
//   final int id;
//   final String name;
//   final String? imageUrl;
//
//   BogoCategory({
//     this.imageUrl,
//     required this.id,
//     required this.name,
//   });
//
//   factory BogoCategory.fromJson(Map<String, dynamic> json) => BogoCategory(
//     id: json['id'],
//     name: json['name'],
//     imageUrl: json['image'] ?? json['imageUrl'],
//   );
// }
//
