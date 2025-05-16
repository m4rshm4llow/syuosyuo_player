// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Data {

 String get lastUpdated; String get debutDate; String get birthday; List<Link> get links; List<Archive> get archives; List<ReadingAloudArchive> get readingAloudArchives;
/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCopyWith<Data> get copyWith => _$DataCopyWithImpl<Data>(this as Data, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&(identical(other.debutDate, debutDate) || other.debutDate == debutDate)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&const DeepCollectionEquality().equals(other.links, links)&&const DeepCollectionEquality().equals(other.archives, archives)&&const DeepCollectionEquality().equals(other.readingAloudArchives, readingAloudArchives));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastUpdated,debutDate,birthday,const DeepCollectionEquality().hash(links),const DeepCollectionEquality().hash(archives),const DeepCollectionEquality().hash(readingAloudArchives));

@override
String toString() {
  return 'Data(lastUpdated: $lastUpdated, debutDate: $debutDate, birthday: $birthday, links: $links, archives: $archives, readingAloudArchives: $readingAloudArchives)';
}


}

/// @nodoc
abstract mixin class $DataCopyWith<$Res>  {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) = _$DataCopyWithImpl;
@useResult
$Res call({
 String lastUpdated, String debutDate, String birthday, List<Link> links, List<Archive> archives, List<ReadingAloudArchive> readingAloudArchives
});




}
/// @nodoc
class _$DataCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastUpdated = null,Object? debutDate = null,Object? birthday = null,Object? links = null,Object? archives = null,Object? readingAloudArchives = null,}) {
  return _then(Data(
lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,debutDate: null == debutDate ? _self.debutDate : debutDate // ignore: cast_nullable_to_non_nullable
as String,birthday: null == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as String,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<Link>,archives: null == archives ? _self.archives : archives // ignore: cast_nullable_to_non_nullable
as List<Archive>,readingAloudArchives: null == readingAloudArchives ? _self.readingAloudArchives : readingAloudArchives // ignore: cast_nullable_to_non_nullable
as List<ReadingAloudArchive>,
  ));
}

}



/// @nodoc
mixin _$Link {

 String get title; String get url;
/// Create a copy of Link
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LinkCopyWith<Link> get copyWith => _$LinkCopyWithImpl<Link>(this as Link, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Link&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,url);

@override
String toString() {
  return 'Link(title: $title, url: $url)';
}


}

/// @nodoc
abstract mixin class $LinkCopyWith<$Res>  {
  factory $LinkCopyWith(Link value, $Res Function(Link) _then) = _$LinkCopyWithImpl;
@useResult
$Res call({
 String title, String url
});




}
/// @nodoc
class _$LinkCopyWithImpl<$Res>
    implements $LinkCopyWith<$Res> {
  _$LinkCopyWithImpl(this._self, this._then);

  final Link _self;
  final $Res Function(Link) _then;

/// Create a copy of Link
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? url = null,}) {
  return _then(Link(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



/// @nodoc
mixin _$Archive {

 String get name; String get date; String get url; List<Song> get songs;
/// Create a copy of Archive
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchiveCopyWith<Archive> get copyWith => _$ArchiveCopyWithImpl<Archive>(this as Archive, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Archive&&(identical(other.name, name) || other.name == name)&&(identical(other.date, date) || other.date == date)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.songs, songs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,date,url,const DeepCollectionEquality().hash(songs));

@override
String toString() {
  return 'Archive(name: $name, date: $date, url: $url, songs: $songs)';
}


}

/// @nodoc
abstract mixin class $ArchiveCopyWith<$Res>  {
  factory $ArchiveCopyWith(Archive value, $Res Function(Archive) _then) = _$ArchiveCopyWithImpl;
@useResult
$Res call({
 String name, String date, String url, List<Song> songs
});




}
/// @nodoc
class _$ArchiveCopyWithImpl<$Res>
    implements $ArchiveCopyWith<$Res> {
  _$ArchiveCopyWithImpl(this._self, this._then);

  final Archive _self;
  final $Res Function(Archive) _then;

/// Create a copy of Archive
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? date = null,Object? url = null,Object? songs = null,}) {
  return _then(Archive(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,songs: null == songs ? _self.songs : songs // ignore: cast_nullable_to_non_nullable
as List<Song>,
  ));
}

}



/// @nodoc
mixin _$Song {

 String get title; String get artist; int get year; String get time;
/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SongCopyWith<Song> get copyWith => _$SongCopyWithImpl<Song>(this as Song, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Song&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.year, year) || other.year == year)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,artist,year,time);

@override
String toString() {
  return 'Song(title: $title, artist: $artist, year: $year, time: $time)';
}


}

/// @nodoc
abstract mixin class $SongCopyWith<$Res>  {
  factory $SongCopyWith(Song value, $Res Function(Song) _then) = _$SongCopyWithImpl;
@useResult
$Res call({
 String title, String artist, int year, String time
});




}
/// @nodoc
class _$SongCopyWithImpl<$Res>
    implements $SongCopyWith<$Res> {
  _$SongCopyWithImpl(this._self, this._then);

  final Song _self;
  final $Res Function(Song) _then;

/// Create a copy of Song
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? artist = null,Object? year = null,Object? time = null,}) {
  return _then(Song(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}



/// @nodoc
mixin _$ReadingAloudArchive {

 String get name; String get date; String get url; List<Timestamp> get timestamps;
/// Create a copy of ReadingAloudArchive
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingAloudArchiveCopyWith<ReadingAloudArchive> get copyWith => _$ReadingAloudArchiveCopyWithImpl<ReadingAloudArchive>(this as ReadingAloudArchive, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingAloudArchive&&(identical(other.name, name) || other.name == name)&&(identical(other.date, date) || other.date == date)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.timestamps, timestamps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,date,url,const DeepCollectionEquality().hash(timestamps));

@override
String toString() {
  return 'ReadingAloudArchive(name: $name, date: $date, url: $url, timestamps: $timestamps)';
}


}

/// @nodoc
abstract mixin class $ReadingAloudArchiveCopyWith<$Res>  {
  factory $ReadingAloudArchiveCopyWith(ReadingAloudArchive value, $Res Function(ReadingAloudArchive) _then) = _$ReadingAloudArchiveCopyWithImpl;
@useResult
$Res call({
 String name, String date, String url, List<Timestamp> timestamps
});




}
/// @nodoc
class _$ReadingAloudArchiveCopyWithImpl<$Res>
    implements $ReadingAloudArchiveCopyWith<$Res> {
  _$ReadingAloudArchiveCopyWithImpl(this._self, this._then);

  final ReadingAloudArchive _self;
  final $Res Function(ReadingAloudArchive) _then;

/// Create a copy of ReadingAloudArchive
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? date = null,Object? url = null,Object? timestamps = null,}) {
  return _then(ReadingAloudArchive(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,timestamps: null == timestamps ? _self.timestamps : timestamps // ignore: cast_nullable_to_non_nullable
as List<Timestamp>,
  ));
}

}



/// @nodoc
mixin _$Timestamp {

 String get description; String get time;
/// Create a copy of Timestamp
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimestampCopyWith<Timestamp> get copyWith => _$TimestampCopyWithImpl<Timestamp>(this as Timestamp, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Timestamp&&(identical(other.description, description) || other.description == description)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,description,time);

@override
String toString() {
  return 'Timestamp(description: $description, time: $time)';
}


}

/// @nodoc
abstract mixin class $TimestampCopyWith<$Res>  {
  factory $TimestampCopyWith(Timestamp value, $Res Function(Timestamp) _then) = _$TimestampCopyWithImpl;
@useResult
$Res call({
 String description, String time
});




}
/// @nodoc
class _$TimestampCopyWithImpl<$Res>
    implements $TimestampCopyWith<$Res> {
  _$TimestampCopyWithImpl(this._self, this._then);

  final Timestamp _self;
  final $Res Function(Timestamp) _then;

/// Create a copy of Timestamp
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? description = null,Object? time = null,}) {
  return _then(Timestamp(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
mixin _$FavoriteSong {

 String get title; String get artist; String get videoId; String get time;
/// Create a copy of FavoriteSong
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteSongCopyWith<FavoriteSong> get copyWith => _$FavoriteSongCopyWithImpl<FavoriteSong>(this as FavoriteSong, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteSong&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.time, time) || other.time == time));
}


@override
int get hashCode => Object.hash(runtimeType,title,artist,videoId,time);

@override
String toString() {
  return 'FavoriteSong(title: $title, artist: $artist, videoId: $videoId, time: $time)';
}


}

/// @nodoc
abstract mixin class $FavoriteSongCopyWith<$Res>  {
  factory $FavoriteSongCopyWith(FavoriteSong value, $Res Function(FavoriteSong) _then) = _$FavoriteSongCopyWithImpl;
@useResult
$Res call({
 String title, String artist, String videoId, String time
});




}
/// @nodoc
class _$FavoriteSongCopyWithImpl<$Res>
    implements $FavoriteSongCopyWith<$Res> {
  _$FavoriteSongCopyWithImpl(this._self, this._then);

  final FavoriteSong _self;
  final $Res Function(FavoriteSong) _then;

/// Create a copy of FavoriteSong
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? artist = null,Object? videoId = null,Object? time = null,}) {
  return _then(FavoriteSong(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
