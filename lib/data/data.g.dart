// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  lastUpdated: json['lastUpdated'] as String,
  debutDate: json['debutDate'] as String,
  birthday: json['birthday'] as String,
  links:
      (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
  archives:
      (json['archives'] as List<dynamic>)
          .map((e) => Archive.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'lastUpdated': instance.lastUpdated,
  'debutDate': instance.debutDate,
  'birthday': instance.birthday,
  'links': instance.links,
  'archives': instance.archives,
};

Link _$LinkFromJson(Map<String, dynamic> json) =>
    Link(title: json['title'] as String, url: json['url'] as String);

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
  'title': instance.title,
  'url': instance.url,
};

Archive _$ArchiveFromJson(Map<String, dynamic> json) => Archive(
  name: json['name'] as String,
  date: json['date'] as String,
  url: json['url'] as String,
  songs:
      (json['songs'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ArchiveToJson(Archive instance) => <String, dynamic>{
  'name': instance.name,
  'date': instance.date,
  'url': instance.url,
  'songs': instance.songs,
};

Song _$SongFromJson(Map<String, dynamic> json) => Song(
  title: json['title'] as String,
  artist: json['artist'] as String,
  year: (json['year'] as num).toInt(),
  time: json['time'] as String,
);

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
  'title': instance.title,
  'artist': instance.artist,
  'year': instance.year,
  'time': instance.time,
};
