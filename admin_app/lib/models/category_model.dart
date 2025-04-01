import 'dart:convert';
CategoryModel categoryModelFromJson(String str) => CategoryModel.fromRawJson(str);
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());
class CategoryModel {
  String id;
  String name;
  String image;
  String banner;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.banner,
  });

  factory CategoryModel.fromRawJson(String str) => CategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    banner: json["banner"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "banner": banner,
  };
}
