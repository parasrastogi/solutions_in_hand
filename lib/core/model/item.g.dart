// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['name'] as String,
      json['gender'] as String,
      json['image_url'] as String,
      DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'name': instance.itemName,
      'gender': instance.gender,
      'image_url': instance.imageUrl,
      'time': instance.dateTime.toIso8601String(),
    };
