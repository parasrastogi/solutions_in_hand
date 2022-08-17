import 'package:cloud_firestore/cloud_firestore.dart';
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

  factory Item.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();

      return Item.fromJson(data!);
  }

  Map<String, dynamic> toFirestore() {
    return _$ItemToJson(this);
  }

}

