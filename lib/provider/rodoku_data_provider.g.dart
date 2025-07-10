// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rodoku_data_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rodokuDataHash() => r'ea782c12ac006bc9529fdb0b656545fd0af150b1';

/// See also [rodokuData].
@ProviderFor(rodokuData)
final rodokuDataProvider = FutureProvider<RodokuData>.internal(
  rodokuData,
  name: r'rodokuDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$rodokuDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RodokuDataRef = FutureProviderRef<RodokuData>;
String _$rodokuDataAchivesHash() => r'5ec567a8124a6ce63acb021414f8a26acc602b65';

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

/// See also [rodokuDataAchives].
@ProviderFor(rodokuDataAchives)
const rodokuDataAchivesProvider = RodokuDataAchivesFamily();

/// See also [rodokuDataAchives].
class RodokuDataAchivesFamily extends Family<AsyncValue<List<RodokuArchive>>> {
  /// See also [rodokuDataAchives].
  const RodokuDataAchivesFamily();

  /// See also [rodokuDataAchives].
  RodokuDataAchivesProvider call(SortLabel sortLabel) {
    return RodokuDataAchivesProvider(sortLabel);
  }

  @override
  RodokuDataAchivesProvider getProviderOverride(
    covariant RodokuDataAchivesProvider provider,
  ) {
    return call(provider.sortLabel);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'rodokuDataAchivesProvider';
}

/// See also [rodokuDataAchives].
class RodokuDataAchivesProvider extends FutureProvider<List<RodokuArchive>> {
  /// See also [rodokuDataAchives].
  RodokuDataAchivesProvider(SortLabel sortLabel)
    : this._internal(
        (ref) => rodokuDataAchives(ref as RodokuDataAchivesRef, sortLabel),
        from: rodokuDataAchivesProvider,
        name: r'rodokuDataAchivesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$rodokuDataAchivesHash,
        dependencies: RodokuDataAchivesFamily._dependencies,
        allTransitiveDependencies:
            RodokuDataAchivesFamily._allTransitiveDependencies,
        sortLabel: sortLabel,
      );

  RodokuDataAchivesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sortLabel,
  }) : super.internal();

  final SortLabel sortLabel;

  @override
  Override overrideWith(
    FutureOr<List<RodokuArchive>> Function(RodokuDataAchivesRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RodokuDataAchivesProvider._internal(
        (ref) => create(ref as RodokuDataAchivesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sortLabel: sortLabel,
      ),
    );
  }

  @override
  FutureProviderElement<List<RodokuArchive>> createElement() {
    return _RodokuDataAchivesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RodokuDataAchivesProvider && other.sortLabel == sortLabel;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sortLabel.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RodokuDataAchivesRef on FutureProviderRef<List<RodokuArchive>> {
  /// The parameter `sortLabel` of this provider.
  SortLabel get sortLabel;
}

class _RodokuDataAchivesProviderElement
    extends FutureProviderElement<List<RodokuArchive>>
    with RodokuDataAchivesRef {
  _RodokuDataAchivesProviderElement(super.provider);

  @override
  SortLabel get sortLabel => (origin as RodokuDataAchivesProvider).sortLabel;
}

String _$rodokuTimestampListHash() =>
    r'bcde8106837067d6fe8da7bda9bee8191ca68f13';

/// See also [rodokuTimestampList].
@ProviderFor(rodokuTimestampList)
const rodokuTimestampListProvider = RodokuTimestampListFamily();

/// See also [rodokuTimestampList].
class RodokuTimestampListFamily extends Family<List<Timestamp>> {
  /// See also [rodokuTimestampList].
  const RodokuTimestampListFamily();

  /// See also [rodokuTimestampList].
  RodokuTimestampListProvider call(String videoId) {
    return RodokuTimestampListProvider(videoId);
  }

  @override
  RodokuTimestampListProvider getProviderOverride(
    covariant RodokuTimestampListProvider provider,
  ) {
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
  String? get name => r'rodokuTimestampListProvider';
}

/// See also [rodokuTimestampList].
class RodokuTimestampListProvider extends AutoDisposeProvider<List<Timestamp>> {
  /// See also [rodokuTimestampList].
  RodokuTimestampListProvider(String videoId)
    : this._internal(
        (ref) => rodokuTimestampList(ref as RodokuTimestampListRef, videoId),
        from: rodokuTimestampListProvider,
        name: r'rodokuTimestampListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$rodokuTimestampListHash,
        dependencies: RodokuTimestampListFamily._dependencies,
        allTransitiveDependencies:
            RodokuTimestampListFamily._allTransitiveDependencies,
        videoId: videoId,
      );

  RodokuTimestampListProvider._internal(
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
  Override overrideWith(
    List<Timestamp> Function(RodokuTimestampListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RodokuTimestampListProvider._internal(
        (ref) => create(ref as RodokuTimestampListRef),
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
  AutoDisposeProviderElement<List<Timestamp>> createElement() {
    return _RodokuTimestampListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RodokuTimestampListProvider && other.videoId == videoId;
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
mixin RodokuTimestampListRef on AutoDisposeProviderRef<List<Timestamp>> {
  /// The parameter `videoId` of this provider.
  String get videoId;
}

class _RodokuTimestampListProviderElement
    extends AutoDisposeProviderElement<List<Timestamp>>
    with RodokuTimestampListRef {
  _RodokuTimestampListProviderElement(super.provider);

  @override
  String get videoId => (origin as RodokuTimestampListProvider).videoId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
