import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromRawJson(str);
String bannerModelToJson(BannerModel data) => json.encode(data.toJson());
class BannerModel {
  String id;
  String banner;

  BannerModel({
    required this.id,
    required this.banner,
  });

  factory BannerModel.fromRawJson(String str) => BannerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["_id"],
    banner: json["banner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "banner": banner,
  };
}
