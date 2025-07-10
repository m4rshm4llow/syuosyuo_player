// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rodoku.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RodokuData {

 String get lastUpdated; List<RodokuArchive> get archives;
/// Create a copy of RodokuData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RodokuDataCopyWith<RodokuData> get copyWith => _$RodokuDataCopyWithImpl<RodokuData>(this as RodokuData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RodokuData&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other.archives, archives));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lastUpdated,const DeepCollectionEquality().hash(archives));

@override
String toString() {
  return 'RodokuData(lastUpdated: $lastUpdated, archives: $archives)';
}


}

/// @nodoc
abstract mixin class $RodokuDataCopyWith<$Res>  {
  factory $RodokuDataCopyWith(RodokuData value, $Res Function(RodokuData) _then) = _$RodokuDataCopyWithImpl;
@useResult
$Res call({
 String lastUpdated, List<RodokuArchive> archives
});




}
/// @nodoc
class _$RodokuDataCopyWithImpl<$Res>
    implements $RodokuDataCopyWith<$Res> {
  _$RodokuDataCopyWithImpl(this._self, this._then);

  final RodokuData _self;
  final $Res Function(RodokuData) _then;

/// Create a copy of RodokuData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lastUpdated = null,Object? archives = null,}) {
  return _then(RodokuData(
lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,archives: null == archives ? _self.archives : archives // ignore: cast_nullable_to_non_nullable
as List<RodokuArchive>,
  ));
}

}



/// @nodoc
mixin _$RodokuArchive {

 String get name; String get date; String get url; List<Timestamp> get timestamps;
/// Create a copy of RodokuArchive
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RodokuArchiveCopyWith<RodokuArchive> get copyWith => _$RodokuArchiveCopyWithImpl<RodokuArchive>(this as RodokuArchive, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RodokuArchive&&(identical(other.name, name) || other.name == name)&&(identical(other.date, date) || other.date == date)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.timestamps, timestamps));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,date,url,const DeepCollectionEquality().hash(timestamps));

@override
String toString() {
  return 'RodokuArchive(name: $name, date: $date, url: $url, timestamps: $timestamps)';
}


}

/// @nodoc
abstract mixin class $RodokuArchiveCopyWith<$Res>  {
  factory $RodokuArchiveCopyWith(RodokuArchive value, $Res Function(RodokuArchive) _then) = _$RodokuArchiveCopyWithImpl;
@useResult
$Res call({
 String name, String date, String url, List<Timestamp> timestamps
});




}
/// @nodoc
class _$RodokuArchiveCopyWithImpl<$Res>
    implements $RodokuArchiveCopyWith<$Res> {
  _$RodokuArchiveCopyWithImpl(this._self, this._then);

  final RodokuArchive _self;
  final $Res Function(RodokuArchive) _then;

/// Create a copy of RodokuArchive
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? date = null,Object? url = null,Object? timestamps = null,}) {
  return _then(RodokuArchive(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,timestamps: null == timestamps ? _self.timestamps : timestamps // ignore: cast_nullable_to_non_nullable
as List<Timestamp>,
  ));
}

}


// dart format on
