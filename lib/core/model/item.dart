import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item{
  @JsonKey(name: "name")
  final String itemName;
  final String gender;
  @JsonKey(name: "image_url")
  final String imageUrl;
  @JsonKey(name: 'time')
  final DateTime dateTime;

  Item(this.itemName, this.gender, this.imageUrl, this.dateTime);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

