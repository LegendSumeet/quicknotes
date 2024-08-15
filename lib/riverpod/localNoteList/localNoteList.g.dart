// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localNoteList.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localNoteSetHash() => r'933ef1ded57709cfb8e6c6327b6b8ce489c095ac';

/// See also [LocalNoteSet].
@ProviderFor(LocalNoteSet)
final localNoteSetProvider =
    AsyncNotifierProvider<LocalNoteSet, Set<LocalNote>>.internal(
  LocalNoteSet.new,
  name: r'localNoteSetProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$localNoteSetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocalNoteSet = AsyncNotifier<Set<LocalNote>>;
String _$localNoteContentHash() => r'bcd4c76e4a0fe2c1962cef977478de610a68ee75';

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

abstract class _$LocalNoteContent extends BuildlessAsyncNotifier<String> {
  late final int id;

  FutureOr<String> build(
    int id,
  );
}

/// See also [LocalNoteContent].
@ProviderFor(LocalNoteContent)
const localNoteContentProvider = LocalNoteContentFamily();

/// See also [LocalNoteContent].
class LocalNoteContentFamily extends Family<AsyncValue<String>> {
  /// See also [LocalNoteContent].
  const LocalNoteContentFamily();

  /// See also [LocalNoteContent].
  LocalNoteContentProvider call(
    int id,
  ) {
    return LocalNoteContentProvider(
      id,
    );
  }

  @override
  LocalNoteContentProvider getProviderOverride(
    covariant LocalNoteContentProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'localNoteContentProvider';
}

/// See also [LocalNoteContent].
class LocalNoteContentProvider
    extends AsyncNotifierProviderImpl<LocalNoteContent, String> {
  /// See also [LocalNoteContent].
  LocalNoteContentProvider(
    int id,
  ) : this._internal(
          () => LocalNoteContent()..id = id,
          from: localNoteContentProvider,
          name: r'localNoteContentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$localNoteContentHash,
          dependencies: LocalNoteContentFamily._dependencies,
          allTransitiveDependencies:
              LocalNoteContentFamily._allTransitiveDependencies,
          id: id,
        );

  LocalNoteContentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  FutureOr<String> runNotifierBuild(
    covariant LocalNoteContent notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(LocalNoteContent Function() create) {
    return ProviderOverride(
      origin: this,
      override: LocalNoteContentProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<LocalNoteContent, String> createElement() {
    return _LocalNoteContentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalNoteContentProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocalNoteContentRef on AsyncNotifierProviderRef<String> {
  /// The parameter `id` of this provider.
  int get id;
}

class _LocalNoteContentProviderElement
    extends AsyncNotifierProviderElement<LocalNoteContent, String>
    with LocalNoteContentRef {
  _LocalNoteContentProviderElement(super.provider);

  @override
  int get id => (origin as LocalNoteContentProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
