// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rodoku.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RodokuData _$RodokuDataFromJson(Map<String, dynamic> json) => RodokuData(
  lastUpdated: json['lastUpdated'] as String,
  archives:
      (json['archives'] as List<dynamic>)
          .map((e) => RodokuArchive.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$RodokuDataToJson(RodokuData instance) =>
    <String, dynamic>{
      'lastUpdated': instance.lastUpdated,
      'archives': instance.archives,
    };

RodokuArchive _$RodokuArchiveFromJson(Map<String, dynamic> json) =>
    RodokuArchive(
      name: json['name'] as String,
      date: json['date'] as String,
      url: json['url'] as String,
      timestamps:
          (json['timestamps'] as List<dynamic>)
              .map((e) => Timestamp.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$RodokuArchiveToJson(RodokuArchive instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'url': instance.url,
      'timestamps': instance.timestamps,
    };
