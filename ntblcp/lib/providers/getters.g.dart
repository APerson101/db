// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getters.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllFacilitiesHash() => r'08783014e801bf2861fd317a17c82b1d6a163afb';

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

/// See also [getAllFacilities].
@ProviderFor(getAllFacilities)
const getAllFacilitiesProvider = GetAllFacilitiesFamily();

/// See also [getAllFacilities].
class GetAllFacilitiesFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [getAllFacilities].
  const GetAllFacilitiesFamily();

  /// See also [getAllFacilities].
  GetAllFacilitiesProvider call(
    String region,
  ) {
    return GetAllFacilitiesProvider(
      region,
    );
  }

  @override
  GetAllFacilitiesProvider getProviderOverride(
    covariant GetAllFacilitiesProvider provider,
  ) {
    return call(
      provider.region,
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
  String? get name => r'getAllFacilitiesProvider';
}

/// See also [getAllFacilities].
class GetAllFacilitiesProvider
    extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [getAllFacilities].
  GetAllFacilitiesProvider(
    String region,
  ) : this._internal(
          (ref) => getAllFacilities(
            ref as GetAllFacilitiesRef,
            region,
          ),
          from: getAllFacilitiesProvider,
          name: r'getAllFacilitiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getAllFacilitiesHash,
          dependencies: GetAllFacilitiesFamily._dependencies,
          allTransitiveDependencies:
              GetAllFacilitiesFamily._allTransitiveDependencies,
          region: region,
        );

  GetAllFacilitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.region,
  }) : super.internal();

  final String region;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(GetAllFacilitiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetAllFacilitiesProvider._internal(
        (ref) => create(ref as GetAllFacilitiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        region: region,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _GetAllFacilitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetAllFacilitiesProvider && other.region == region;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, region.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetAllFacilitiesRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `region` of this provider.
  String get region;
}

class _GetAllFacilitiesProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with GetAllFacilitiesRef {
  _GetAllFacilitiesProviderElement(super.provider);

  @override
  String get region => (origin as GetAllFacilitiesProvider).region;
}

String _$getLocationFacilitiesHash() =>
    r'683e4d6a7bd32195cedfc7b6e87d64c3118ed653';

/// See also [getLocationFacilities].
@ProviderFor(getLocationFacilities)
const getLocationFacilitiesProvider = GetLocationFacilitiesFamily();

/// See also [getLocationFacilities].
class GetLocationFacilitiesFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [getLocationFacilities].
  const GetLocationFacilitiesFamily();

  /// See also [getLocationFacilities].
  GetLocationFacilitiesProvider call(
    dynamic region,
  ) {
    return GetLocationFacilitiesProvider(
      region,
    );
  }

  @override
  GetLocationFacilitiesProvider getProviderOverride(
    covariant GetLocationFacilitiesProvider provider,
  ) {
    return call(
      provider.region,
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
  String? get name => r'getLocationFacilitiesProvider';
}

/// See also [getLocationFacilities].
class GetLocationFacilitiesProvider
    extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [getLocationFacilities].
  GetLocationFacilitiesProvider(
    dynamic region,
  ) : this._internal(
          (ref) => getLocationFacilities(
            ref as GetLocationFacilitiesRef,
            region,
          ),
          from: getLocationFacilitiesProvider,
          name: r'getLocationFacilitiesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLocationFacilitiesHash,
          dependencies: GetLocationFacilitiesFamily._dependencies,
          allTransitiveDependencies:
              GetLocationFacilitiesFamily._allTransitiveDependencies,
          region: region,
        );

  GetLocationFacilitiesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.region,
  }) : super.internal();

  final dynamic region;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(GetLocationFacilitiesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetLocationFacilitiesProvider._internal(
        (ref) => create(ref as GetLocationFacilitiesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        region: region,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _GetLocationFacilitiesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetLocationFacilitiesProvider && other.region == region;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, region.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetLocationFacilitiesRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `region` of this provider.
  dynamic get region;
}

class _GetLocationFacilitiesProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with GetLocationFacilitiesRef {
  _GetLocationFacilitiesProviderElement(super.provider);

  @override
  dynamic get region => (origin as GetLocationFacilitiesProvider).region;
}

String _$getUserHash() => r'49aea71aba8178d9c3081d9aae4421a6754abdd8';

/// See also [getUser].
@ProviderFor(getUser)
const getUserProvider = GetUserFamily();

/// See also [getUser].
class GetUserFamily extends Family<AsyncValue<dynamic>> {
  /// See also [getUser].
  const GetUserFamily();

  /// See also [getUser].
  GetUserProvider call(
    String email,
  ) {
    return GetUserProvider(
      email,
    );
  }

  @override
  GetUserProvider getProviderOverride(
    covariant GetUserProvider provider,
  ) {
    return call(
      provider.email,
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
  String? get name => r'getUserProvider';
}

/// See also [getUser].
class GetUserProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [getUser].
  GetUserProvider(
    String email,
  ) : this._internal(
          (ref) => getUser(
            ref as GetUserRef,
            email,
          ),
          from: getUserProvider,
          name: r'getUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserHash,
          dependencies: GetUserFamily._dependencies,
          allTransitiveDependencies: GetUserFamily._allTransitiveDependencies,
          email: email,
        );

  GetUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String email;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(GetUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserProvider._internal(
        (ref) => create(ref as GetUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _GetUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetUserRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `email` of this provider.
  String get email;
}

class _GetUserProviderElement extends AutoDisposeFutureProviderElement<dynamic>
    with GetUserRef {
  _GetUserProviderElement(super.provider);

  @override
  String get email => (origin as GetUserProvider).email;
}

String _$getReportsHash() => r'dfa35a57a567c98f99d6729e14fc327090307af6';

/// See also [getReports].
@ProviderFor(getReports)
const getReportsProvider = GetReportsFamily();

/// See also [getReports].
class GetReportsFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [getReports].
  const GetReportsFamily();

  /// See also [getReports].
  GetReportsProvider call(
    String? facilityId,
    String? minDate,
    String? maxDate,
  ) {
    return GetReportsProvider(
      facilityId,
      minDate,
      maxDate,
    );
  }

  @override
  GetReportsProvider getProviderOverride(
    covariant GetReportsProvider provider,
  ) {
    return call(
      provider.facilityId,
      provider.minDate,
      provider.maxDate,
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
  String? get name => r'getReportsProvider';
}

/// See also [getReports].
class GetReportsProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [getReports].
  GetReportsProvider(
    String? facilityId,
    String? minDate,
    String? maxDate,
  ) : this._internal(
          (ref) => getReports(
            ref as GetReportsRef,
            facilityId,
            minDate,
            maxDate,
          ),
          from: getReportsProvider,
          name: r'getReportsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getReportsHash,
          dependencies: GetReportsFamily._dependencies,
          allTransitiveDependencies:
              GetReportsFamily._allTransitiveDependencies,
          facilityId: facilityId,
          minDate: minDate,
          maxDate: maxDate,
        );

  GetReportsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.facilityId,
    required this.minDate,
    required this.maxDate,
  }) : super.internal();

  final String? facilityId;
  final String? minDate;
  final String? maxDate;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(GetReportsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetReportsProvider._internal(
        (ref) => create(ref as GetReportsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        facilityId: facilityId,
        minDate: minDate,
        maxDate: maxDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _GetReportsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetReportsProvider &&
        other.facilityId == facilityId &&
        other.minDate == minDate &&
        other.maxDate == maxDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, facilityId.hashCode);
    hash = _SystemHash.combine(hash, minDate.hashCode);
    hash = _SystemHash.combine(hash, maxDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetReportsRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `facilityId` of this provider.
  String? get facilityId;

  /// The parameter `minDate` of this provider.
  String? get minDate;

  /// The parameter `maxDate` of this provider.
  String? get maxDate;
}

class _GetReportsProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>> with GetReportsRef {
  _GetReportsProviderElement(super.provider);

  @override
  String? get facilityId => (origin as GetReportsProvider).facilityId;
  @override
  String? get minDate => (origin as GetReportsProvider).minDate;
  @override
  String? get maxDate => (origin as GetReportsProvider).maxDate;
}

String _$getFacilityProductStockCardHash() =>
    r'414b04480fd214ca1c4163166b98848a7daa3c33';

/// See also [getFacilityProductStockCard].
@ProviderFor(getFacilityProductStockCard)
const getFacilityProductStockCardProvider = GetFacilityProductStockCardFamily();

/// See also [getFacilityProductStockCard].
class GetFacilityProductStockCardFamily
    extends Family<AsyncValue<List<dynamic>>> {
  /// See also [getFacilityProductStockCard].
  const GetFacilityProductStockCardFamily();

  /// See also [getFacilityProductStockCard].
  GetFacilityProductStockCardProvider call(
    String facilityId,
    String productId,
  ) {
    return GetFacilityProductStockCardProvider(
      facilityId,
      productId,
    );
  }

  @override
  GetFacilityProductStockCardProvider getProviderOverride(
    covariant GetFacilityProductStockCardProvider provider,
  ) {
    return call(
      provider.facilityId,
      provider.productId,
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
  String? get name => r'getFacilityProductStockCardProvider';
}

/// See also [getFacilityProductStockCard].
class GetFacilityProductStockCardProvider
    extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [getFacilityProductStockCard].
  GetFacilityProductStockCardProvider(
    String facilityId,
    String productId,
  ) : this._internal(
          (ref) => getFacilityProductStockCard(
            ref as GetFacilityProductStockCardRef,
            facilityId,
            productId,
          ),
          from: getFacilityProductStockCardProvider,
          name: r'getFacilityProductStockCardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFacilityProductStockCardHash,
          dependencies: GetFacilityProductStockCardFamily._dependencies,
          allTransitiveDependencies:
              GetFacilityProductStockCardFamily._allTransitiveDependencies,
          facilityId: facilityId,
          productId: productId,
        );

  GetFacilityProductStockCardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.facilityId,
    required this.productId,
  }) : super.internal();

  final String facilityId;
  final String productId;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(GetFacilityProductStockCardRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetFacilityProductStockCardProvider._internal(
        (ref) => create(ref as GetFacilityProductStockCardRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        facilityId: facilityId,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _GetFacilityProductStockCardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFacilityProductStockCardProvider &&
        other.facilityId == facilityId &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, facilityId.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetFacilityProductStockCardRef
    on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `facilityId` of this provider.
  String get facilityId;

  /// The parameter `productId` of this provider.
  String get productId;
}

class _GetFacilityProductStockCardProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with GetFacilityProductStockCardRef {
  _GetFacilityProductStockCardProviderElement(super.provider);

  @override
  String get facilityId =>
      (origin as GetFacilityProductStockCardProvider).facilityId;
  @override
  String get productId =>
      (origin as GetFacilityProductStockCardProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
