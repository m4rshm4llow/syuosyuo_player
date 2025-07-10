// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dataHash() => r'8904ea3be54549c8847b92bac94b62f9b61b161a';

/// See also [data].
@ProviderFor(data)
final dataProvider = FutureProvider<Data>.internal(
  data,
  name: r'dataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DataRef = FutureProviderRef<Data>;
String _$utawakuAchivesHash() => r'a1ad676cb2e995d05afeae6d8e667e59ffd0d0d9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [utawakuAchives].
@ProviderFor(utawakuAchives)
const utawakuAchivesProvider = UtawakuAchivesFamily();

/// See also [utawakuAchives].
class UtawakuAchivesFamily extends Family<AsyncValue<List<Archive>>> {
  /// See also [utawakuAchives].
  const UtawakuAchivesFamily();

  /// See also [utawakuAchives].
  UtawakuAchivesProvider call(SortLabel sortLabel, FilterLabel filterLabel) {
    return UtawakuAchivesProvider(sortLabel, filterLabel);
  }

  @override
  UtawakuAchivesProvider getProviderOverride(
    covariant UtawakuAchivesProvider provider,
  ) {
    return call(provider.sortLabel, provider.filterLabel);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'utawakuAchivesProvider';
}

/// See also [utawakuAchives].
class UtawakuAchivesProvider extends FutureProvider<List<Archive>> {
  /// See also [utawakuAchives].
  UtawakuAchivesProvider(SortLabel sortLabel, FilterLabel filterLabel)
    : this._internal(
        (ref) =>
            utawakuAchives(ref as UtawakuAchivesRef, sortLabel, filterLabel),
        from: utawakuAchivesProvider,
        name: r'utawakuAchivesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$utawakuAchivesHash,
        dependencies: UtawakuAchivesFamily._dependencies,
        allTransitiveDependencies:
            UtawakuAchivesFamily._allTransitiveDependencies,
        sortLabel: sortLabel,
        filterLabel: filterLabel,
      );

  UtawakuAchivesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sortLabel,
    required this.filterLabel,
  }) : super.internal();

  final SortLabel sortLabel;
  final FilterLabel filterLabel;

  @override
  Override overrideWith(
    FutureOr<List<Archive>> Function(UtawakuAchivesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UtawakuAchivesProvider._internal(
        (ref) => create(ref as UtawakuAchivesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sortLabel: sortLabel,
        filterLabel: filterLabel,
      ),
    );
  }

  @override
  FutureProviderElement<List<Archive>> createElement() {
    return _UtawakuAchivesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UtawakuAchivesProvider &&
        other.sortLabel == sortLabel &&
        other.filterLabel == filterLabel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sortLabel.hashCode);
    hash = _SystemHash.combine(hash, filterLabel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UtawakuAchivesRef on FutureProviderRef<List<Archive>> {
  /// The parameter `sortLabel` of this provider.
  SortLabel get sortLabel;

  /// The parameter `filterLabel` of this provider.
  FilterLabel get filterLabel;
}

class _UtawakuAchivesProviderElement
    extends FutureProviderElement<List<Archive>>
    with UtawakuAchivesRef {
  _UtawakuAchivesProviderElement(super.provider);

  @override
  SortLabel get sortLabel => (origin as UtawakuAchivesProvider).sortLabel;
  @override
  FilterLabel get filterLabel => (origin as UtawakuAchivesProvider).filterLabel;
}

String _$titleCountHash() => r'781e0713566e008be05936e1748fdaf832b09c01';

/// See also [titleCount].
@ProviderFor(titleCount)
const titleCountProvider = TitleCountFamily();

/// See also [titleCount].
class TitleCountFamily extends Family<Map<Song, int>> {
  /// See also [titleCount].
  const TitleCountFamily();

  /// See also [titleCount].
  TitleCountProvider call(EraLabel eraLabel) {
    return TitleCountProvider(eraLabel);
  }

  @override
  TitleCountProvider getProviderOverride(
    covariant TitleCountProvider provider,
  ) {
    return call(provider.eraLabel);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'titleCountProvider';
}

/// See also [titleCount].
class TitleCountProvider extends Provider<Map<Song, int>> {
  /// See also [titleCount].
  TitleCountProvider(EraLabel eraLabel)
    : this._internal(
        (ref) => titleCount(ref as TitleCountRef, eraLabel),
        from: titleCountProvider,
        name: r'titleCountProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$titleCountHash,
        dependencies: TitleCountFamily._dependencies,
        allTransitiveDependencies: TitleCountFamily._allTransitiveDependencies,
        eraLabel: eraLabel,
      );

  TitleCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eraLabel,
  }) : super.internal();

  final EraLabel eraLabel;

  @override
  Override overrideWith(
    Map<Song, int> Function(TitleCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TitleCountProvider._internal(
        (ref) => create(ref as TitleCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eraLabel: eraLabel,
      ),
    );
  }

  @override
  ProviderElement<Map<Song, int>> createElement() {
    return _TitleCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TitleCountProvider && other.eraLabel == eraLabel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eraLabel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TitleCountRef on ProviderRef<Map<Song, int>> {
  /// The parameter `eraLabel` of this provider.
  EraLabel get eraLabel;
}

class _TitleCountProviderElement extends ProviderElement<Map<Song, int>>
    with TitleCountRef {
  _TitleCountProviderElement(super.provider);

  @override
  EraLabel get eraLabel => (origin as TitleCountProvider).eraLabel;
}

String _$titleSetCountHash() => r'790aa0a2e068421bcd67677b9e33fc24ca0fb4b2';

/// See also [titleSetCount].
@ProviderFor(titleSetCount)
const titleSetCountProvider = TitleSetCountFamily();

/// See also [titleSetCount].
class TitleSetCountFamily extends Family<Map<Song, int>> {
  /// See also [titleSetCount].
  const TitleSetCountFamily();

  /// See also [titleSetCount].
  TitleSetCountProvider call(EraLabel eraLabel) {
    return TitleSetCountProvider(eraLabel);
  }

  @override
  TitleSetCountProvider getProviderOverride(
    covariant TitleSetCountProvider provider,
  ) {
    return call(provider.eraLabel);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'titleSetCountProvider';
}

/// See also [titleSetCount].
class TitleSetCountProvider extends Provider<Map<Song, int>> {
  /// See also [titleSetCount].
  TitleSetCountProvider(EraLabel eraLabel)
    : this._internal(
        (ref) => titleSetCount(ref as TitleSetCountRef, eraLabel),
        from: titleSetCountProvider,
        name: r'titleSetCountProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$titleSetCountHash,
        dependencies: TitleSetCountFamily._dependencies,
        allTransitiveDependencies:
            TitleSetCountFamily._allTransitiveDependencies,
        eraLabel: eraLabel,
      );

  TitleSetCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eraLabel,
  }) : super.internal();

  final EraLabel eraLabel;

  @override
  Override overrideWith(
    Map<Song, int> Function(TitleSetCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TitleSetCountProvider._internal(
        (ref) => create(ref as TitleSetCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eraLabel: eraLabel,
      ),
    );
  }

  @override
  ProviderElement<Map<Song, int>> createElement() {
    return _TitleSetCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TitleSetCountProvider && other.eraLabel == eraLabel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eraLabel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TitleSetCountRef on ProviderRef<Map<Song, int>> {
  /// The parameter `eraLabel` of this provider.
  EraLabel get eraLabel;
}

class _TitleSetCountProviderElement extends ProviderElement<Map<Song, int>>
    with TitleSetCountRef {
  _TitleSetCountProviderElement(super.provider);

  @override
  EraLabel get eraLabel => (origin as TitleSetCountProvider).eraLabel;
}

String _$combinedTitleCountsHash() =>
    r'b1a6391316719925f71c2added3c28a54f7551c0';

/// See also [combinedTitleCounts].
@ProviderFor(combinedTitleCounts)
const combinedTitleCountsProvider = CombinedTitleCountsFamily();

/// See also [combinedTitleCounts].
class CombinedTitleCountsFamily extends Family<Map<Song, (int, int)>> {
  /// See also [combinedTitleCounts].
  const CombinedTitleCountsFamily();

  /// See also [combinedTitleCounts].
  CombinedTitleCountsProvider call(
    EraLabel eraLabel,
    SongSortLabel filterLabel,
  ) {
    return CombinedTitleCountsProvider(eraLabel, filterLabel);
  }

  @override
  CombinedTitleCountsProvider getProviderOverride(
    covariant CombinedTitleCountsProvider provider,
  ) {
    return call(provider.eraLabel, provider.filterLabel);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'combinedTitleCountsProvider';
}

/// See also [combinedTitleCounts].
class CombinedTitleCountsProvider extends Provider<Map<Song, (int, int)>> {
  /// See also [combinedTitleCounts].
  CombinedTitleCountsProvider(EraLabel eraLabel, SongSortLabel filterLabel)
    : this._internal(
        (ref) => combinedTitleCounts(
          ref as CombinedTitleCountsRef,
          eraLabel,
          filterLabel,
        ),
        from: combinedTitleCountsProvider,
        name: r'combinedTitleCountsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$combinedTitleCountsHash,
        dependencies: CombinedTitleCountsFamily._dependencies,
        allTransitiveDependencies:
            CombinedTitleCountsFamily._allTransitiveDependencies,
        eraLabel: eraLabel,
        filterLabel: filterLabel,
      );

  CombinedTitleCountsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eraLabel,
    required this.filterLabel,
  }) : super.internal();

  final EraLabel eraLabel;
  final SongSortLabel filterLabel;

  @override
  Override overrideWith(
    Map<Song, (int, int)> Function(CombinedTitleCountsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CombinedTitleCountsProvider._internal(
        (ref) => create(ref as CombinedTitleCountsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eraLabel: eraLabel,
        filterLabel: filterLabel,
      ),
    );
  }

  @override
  ProviderElement<Map<Song, (int, int)>> createElement() {
    return _CombinedTitleCountsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CombinedTitleCountsProvider &&
        other.eraLabel == eraLabel &&
        other.filterLabel == filterLabel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eraLabel.hashCode);
    hash = _SystemHash.combine(hash, filterLabel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CombinedTitleCountsRef on ProviderRef<Map<Song, (int, int)>> {
  /// The parameter `eraLabel` of this provider.
  EraLabel get eraLabel;

  /// The parameter `filterLabel` of this provider.
  SongSortLabel get filterLabel;
}

class _CombinedTitleCountsProviderElement
    extends ProviderElement<Map<Song, (int, int)>>
    with CombinedTitleCountsRef {
  _CombinedTitleCountsProviderElement(super.provider);

  @override
  EraLabel get eraLabel => (origin as CombinedTitleCountsProvider).eraLabel;
  @override
  SongSortLabel get filterLabel =>
      (origin as CombinedTitleCountsProvider).filterLabel;
}

String _$artistCountHash() => r'7afc09526054caa3fbf6b0f44669079a81818619';

/// See also [artistCount].
@ProviderFor(artistCount)
final artistCountProvider = Provider<Map<Song, int>>.internal(
  artistCount,
  name: r'artistCountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$artistCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ArtistCountRef = ProviderRef<Map<Song, int>>;
String _$songListHash() => r'f42c3e30296e0d5b08ffefa4b2d2c333898c022d';

/// See also [songList].
@ProviderFor(songList)
const songListProvider = SongListFamily();

/// See also [songList].
class SongListFamily extends Family<List<Song>> {
  /// See also [songList].
  const SongListFamily();

  /// See also [songList].
  SongListProvider call(String videoId) {
    return SongListProvider(videoId);
  }

  @override
  SongListProvider getProviderOverride(covariant SongListProvider provider) {
    return call(provider.videoId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'songListProvider';
}

/// See also [songList].
class SongListProvider extends AutoDisposeProvider<List<Song>> {
  /// See also [songList].
  SongListProvider(String videoId)
    : this._internal(
        (ref) => songList(ref as SongListRef, videoId),
        from: songListProvider,
        name: r'songListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$songListHash,
        dependencies: SongListFamily._dependencies,
        allTransitiveDependencies: SongListFamily._allTransitiveDependencies,
        videoId: videoId,
      );

  SongListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.videoId,
  }) : super.internal();

  final String videoId;

  @override
  Override overrideWith(List<Song> Function(SongListRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: SongListProvider._internal(
        (ref) => create(ref as SongListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        videoId: videoId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<Song>> createElement() {
    return _SongListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SongListProvider && other.videoId == videoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, videoId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SongListRef on AutoDisposeProviderRef<List<Song>> {
  /// The parameter `videoId` of this provider.
  String get videoId;
}

class _SongListProviderElement extends AutoDisposeProviderElement<List<Song>>
    with SongListRef {
  _SongListProviderElement(super.provider);

  @override
  String get videoId => (origin as SongListProvider).videoId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
