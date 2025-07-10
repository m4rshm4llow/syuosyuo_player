// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
@JsonSerializable()
class Data with _$Data {
  const Data({
    required this.lastUpdated,
    required this.debutDate,
    required this.birthday,
    required this.links,
    required this.archives,
  });

  final String lastUpdated;
  final String debutDate;
  final String birthday;
  final List<Link> links;
  final List<Archive> archives;

  factory Data.fromJson(Map<String, Object?> json) => _$DataFromJson(json);

  Map<String, Object?> toJson() => _$DataToJson(this);
}

@freezed
@JsonSerializable()
class Link with _$Link {
  const Link({required this.title, required this.url});

  final String title;
  final String url;

  factory Link.fromJson(Map<String, Object?> json) => _$LinkFromJson(json);

  Map<String, Object?> toJson() => _$LinkToJson(this);
}

@freezed
@JsonSerializable()
class Archive with _$Archive {
  const Archive({required this.name, required this.date, required this.url, required this.songs});

  final String name;
  final String date;
  final String url;
  final List<Song> songs;

  /// YouTube の URLから videoId を取得する
  /// 例: https://www.youtube.com/watch?v=VIDEO_ID
  String get videoId => url.split('v=')[1].split('&')[0];

  factory Archive.fromJson(Map<String, Object?> json) => _$ArchiveFromJson(json);

  Map<String, Object?> toJson() => _$ArchiveToJson(this);
}

@freezed
@JsonSerializable()
class Song with _$Song {
  const Song({required this.title, required this.artist, required this.year, required this.time});

  final String title;
  final String artist;
  final int year;
  final String time;

  factory Song.fromJson(Map<String, Object?> json) => _$SongFromJson(json);

  Map<String, Object?> toJson() => _$SongToJson(this);
}

@freezed
@JsonSerializable()
class Timestamp with _$Timestamp {
  const Timestamp({required this.description, required this.time});

  final String description;
  final String time;

  factory Timestamp.fromJson(Map<String, Object?> json) => _$TimestampFromJson(json);

  Map<String, Object?> toJson() => _$TimestampToJson(this);
}

@freezed
class FavoriteSong with _$FavoriteSong {
  const FavoriteSong({
    required this.title,
    required this.artist,
    required this.videoId,
    required this.time,
  });

  final String title;
  final String artist;
  final String videoId;
  final String time;

  String get videoKey => '${videoId}_$time';
}
