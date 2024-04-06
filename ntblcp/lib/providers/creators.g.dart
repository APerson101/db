// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creators.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recordMEdataHash() => r'2f4e2a1b7c52ceb68669c59c1e54c48c4e195363';

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

/// See also [recordMEdata].
@ProviderFor(recordMEdata)
const recordMEdataProvider = RecordMEdataFamily();

/// See also [recordMEdata].
class RecordMEdataFamily extends Family<AsyncValue<void>> {
  /// See also [recordMEdata].
  const RecordMEdataFamily();

  /// See also [recordMEdata].
  RecordMEdataProvider call(
    dynamic data,
  ) {
    return RecordMEdataProvider(
      data,
    );
  }

  @override
  RecordMEdataProvider getProviderOverride(
    covariant RecordMEdataProvider provider,
  ) {
    return call(
      provider.data,
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
  String? get name => r'recordMEdataProvider';
}

/// See also [recordMEdata].
class RecordMEdataProvider extends AutoDisposeFutureProvider<void> {
  /// See also [recordMEdata].
  RecordMEdataProvider(
    dynamic data,
  ) : this._internal(
          (ref) => recordMEdata(
            ref as RecordMEdataRef,
            data,
          ),
          from: recordMEdataProvider,
          name: r'recordMEdataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recordMEdataHash,
          dependencies: RecordMEdataFamily._dependencies,
          allTransitiveDependencies:
              RecordMEdataFamily._allTransitiveDependencies,
          data: data,
        );

  RecordMEdataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final dynamic data;

  @override
  Override overrideWith(
    FutureOr<void> Function(RecordMEdataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecordMEdataProvider._internal(
        (ref) => create(ref as RecordMEdataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RecordMEdataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecordMEdataProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecordMEdataRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `data` of this provider.
  dynamic get data;
}

class _RecordMEdataProviderElement
    extends AutoDisposeFutureProviderElement<void> with RecordMEdataRef {
  _RecordMEdataProviderElement(super.provider);

  @override
  dynamic get data => (origin as RecordMEdataProvider).data;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
