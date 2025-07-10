// ignore_for_file: annotate_overrides

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:syuosyuo_player/data/data.dart';

part 'rodoku.freezed.dart';
part 'rodoku.g.dart';

@freezed
@JsonSerializable()
class RodokuData with _$RodokuData {
  const RodokuData({required this.lastUpdated, required this.archives});

  final String lastUpdated;
  final List<RodokuArchive> archives;

  factory RodokuData.fromJson(Map<String, Object?> json) => _$RodokuDataFromJson(json);

  Map<String, Object?> toJson() => _$RodokuDataToJson(this);
}

@freezed
@JsonSerializable()
class RodokuArchive with _$RodokuArchive {
  const RodokuArchive({
    required this.name,
    required this.date,
    required this.url,
    required this.timestamps,
  });

  final String name;
  final String date;
  final String url;
  final List<Timestamp> timestamps;

  factory RodokuArchive.fromJson(Map<String, Object?> json) => _$RodokuArchiveFromJson(json);

  Map<String, Object?> toJson() => _$RodokuArchiveToJson(this);
}
