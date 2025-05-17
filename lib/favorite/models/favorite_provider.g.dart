// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteSongListHash() => r'a0d8c972ecdc8c4ab67636fefeee533f65af3b10';

/// See also [favoriteSongList].
@ProviderFor(favoriteSongList)
final favoriteSongListProvider = Provider<List<FavoriteSong>>.internal(
  favoriteSongList,
  name: r'favoriteSongListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$favoriteSongListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoriteSongListRef = ProviderRef<List<FavoriteSong>>;
String _$favoriteHash() => r'e5bc09b0c8b738c105ce2d86e480c069b865921b';

/// お気に入りの歌を管理する
///
/// Copied from [Favorite].
@ProviderFor(Favorite)
final favoriteProvider = AsyncNotifierProvider<Favorite, List<String>>.internal(
  Favorite.new,
  name: r'favoriteProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$favoriteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Favorite = AsyncNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
