// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$localApiNoteSetHash() => r'eb2936482f61d5d9f8d6667b008c639f72c4cdca';

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

abstract class _$LocalApiNoteSet extends BuildlessNotifier<void> {
  late final LocalNoteAction actions;
  late final LocalNote? note;

  void build({
    required LocalNoteAction actions,
    LocalNote? note,
  });
}

/// See also [LocalApiNoteSet].
@ProviderFor(LocalApiNoteSet)
const localApiNoteSetProvider = LocalApiNoteSetFamily();

/// See also [LocalApiNoteSet].
class LocalApiNoteSetFamily extends Family<void> {
  /// See also [LocalApiNoteSet].
  const LocalApiNoteSetFamily();

  /// See also [LocalApiNoteSet].
  LocalApiNoteSetProvider call({
    required LocalNoteAction actions,
    LocalNote? note,
  }) {
    return LocalApiNoteSetProvider(
      actions: actions,
      note: note,
    );
  }

  @override
  LocalApiNoteSetProvider getProviderOverride(
    covariant LocalApiNoteSetProvider provider,
  ) {
    return call(
      actions: provider.actions,
      note: provider.note,
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
  String? get name => r'localApiNoteSetProvider';
}

/// See also [LocalApiNoteSet].
class LocalApiNoteSetProvider
    extends NotifierProviderImpl<LocalApiNoteSet, void> {
  /// See also [LocalApiNoteSet].
  LocalApiNoteSetProvider({
    required LocalNoteAction actions,
    LocalNote? note,
  }) : this._internal(
          () => LocalApiNoteSet()
            ..actions = actions
            ..note = note,
          from: localApiNoteSetProvider,
          name: r'localApiNoteSetProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$localApiNoteSetHash,
          dependencies: LocalApiNoteSetFamily._dependencies,
          allTransitiveDependencies:
              LocalApiNoteSetFamily._allTransitiveDependencies,
          actions: actions,
          note: note,
        );

  LocalApiNoteSetProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.actions,
    required this.note,
  }) : super.internal();

  final LocalNoteAction actions;
  final LocalNote? note;

  @override
  void runNotifierBuild(
    covariant LocalApiNoteSet notifier,
  ) {
    return notifier.build(
      actions: actions,
      note: note,
    );
  }

  @override
  Override overrideWith(LocalApiNoteSet Function() create) {
    return ProviderOverride(
      origin: this,
      override: LocalApiNoteSetProvider._internal(
        () => create()
          ..actions = actions
          ..note = note,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        actions: actions,
        note: note,
      ),
    );
  }

  @override
  NotifierProviderElement<LocalApiNoteSet, void> createElement() {
    return _LocalApiNoteSetProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocalApiNoteSetProvider &&
        other.actions == actions &&
        other.note == note;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, actions.hashCode);
    hash = _SystemHash.combine(hash, note.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocalApiNoteSetRef on NotifierProviderRef<void> {
  /// The parameter `actions` of this provider.
  LocalNoteAction get actions;

  /// The parameter `note` of this provider.
  LocalNote? get note;
}

class _LocalApiNoteSetProviderElement
    extends NotifierProviderElement<LocalApiNoteSet, void>
    with LocalApiNoteSetRef {
  _LocalApiNoteSetProviderElement(super.provider);

  @override
  LocalNoteAction get actions => (origin as LocalApiNoteSetProvider).actions;
  @override
  LocalNote? get note => (origin as LocalApiNoteSetProvider).note;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
