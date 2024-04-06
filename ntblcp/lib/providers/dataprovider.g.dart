// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dataprovider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFacilitiesHash() => r'347af12e34dff34796df6ade4243855b1939e08e';

/// See also [getFacilities].
@ProviderFor(getFacilities)
final getFacilitiesProvider = AutoDisposeFutureProvider<void>.internal(
  getFacilities,
  name: r'getFacilitiesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getFacilitiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetFacilitiesRef = AutoDisposeFutureProviderRef<void>;
String _$createNationalFacilityHash() =>
    r'4b7c9ff1467ae3a090084ef92fc25ce91c2143ed';

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

/// See also [createNationalFacility].
@ProviderFor(createNationalFacility)
const createNationalFacilityProvider = CreateNationalFacilityFamily();

/// See also [createNationalFacility].
class CreateNationalFacilityFamily extends Family<AsyncValue<bool>> {
  /// See also [createNationalFacility].
  const CreateNationalFacilityFamily();

  /// See also [createNationalFacility].
  CreateNationalFacilityProvider call(
    Map<String, dynamic> facility,
  ) {
    return CreateNationalFacilityProvider(
      facility,
    );
  }

  @override
  CreateNationalFacilityProvider getProviderOverride(
    covariant CreateNationalFacilityProvider provider,
  ) {
    return call(
      provider.facility,
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
  String? get name => r'createNationalFacilityProvider';
}

/// See also [createNationalFacility].
class CreateNationalFacilityProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [createNationalFacility].
  CreateNationalFacilityProvider(
    Map<String, dynamic> facility,
  ) : this._internal(
          (ref) => createNationalFacility(
            ref as CreateNationalFacilityRef,
            facility,
          ),
          from: createNationalFacilityProvider,
          name: r'createNationalFacilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createNationalFacilityHash,
          dependencies: CreateNationalFacilityFamily._dependencies,
          allTransitiveDependencies:
              CreateNationalFacilityFamily._allTransitiveDependencies,
          facility: facility,
        );

  CreateNationalFacilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.facility,
  }) : super.internal();

  final Map<String, dynamic> facility;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CreateNationalFacilityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateNationalFacilityProvider._internal(
        (ref) => create(ref as CreateNationalFacilityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        facility: facility,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CreateNationalFacilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateNationalFacilityProvider &&
        other.facility == facility;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, facility.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateNationalFacilityRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `facility` of this provider.
  Map<String, dynamic> get facility;
}

class _CreateNationalFacilityProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with CreateNationalFacilityRef {
  _CreateNationalFacilityProviderElement(super.provider);

  @override
  Map<String, dynamic> get facility =>
      (origin as CreateNationalFacilityProvider).facility;
}

String _$createFacilityHash() => r'76a99b447e9df781cf126fed45a1f87602576768';

/// See also [createFacility].
@ProviderFor(createFacility)
const createFacilityProvider = CreateFacilityFamily();

/// See also [createFacility].
class CreateFacilityFamily extends Family<AsyncValue<bool>> {
  /// See also [createFacility].
  const CreateFacilityFamily();

  /// See also [createFacility].
  CreateFacilityProvider call(
    String facilityId,
    String inventoryId,
  ) {
    return CreateFacilityProvider(
      facilityId,
      inventoryId,
    );
  }

  @override
  CreateFacilityProvider getProviderOverride(
    covariant CreateFacilityProvider provider,
  ) {
    return call(
      provider.facilityId,
      provider.inventoryId,
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
  String? get name => r'createFacilityProvider';
}

/// See also [createFacility].
class CreateFacilityProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [createFacility].
  CreateFacilityProvider(
    String facilityId,
    String inventoryId,
  ) : this._internal(
          (ref) => createFacility(
            ref as CreateFacilityRef,
            facilityId,
            inventoryId,
          ),
          from: createFacilityProvider,
          name: r'createFacilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createFacilityHash,
          dependencies: CreateFacilityFamily._dependencies,
          allTransitiveDependencies:
              CreateFacilityFamily._allTransitiveDependencies,
          facilityId: facilityId,
          inventoryId: inventoryId,
        );

  CreateFacilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.facilityId,
    required this.inventoryId,
  }) : super.internal();

  final String facilityId;
  final String inventoryId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CreateFacilityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateFacilityProvider._internal(
        (ref) => create(ref as CreateFacilityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        facilityId: facilityId,
        inventoryId: inventoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CreateFacilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateFacilityProvider &&
        other.facilityId == facilityId &&
        other.inventoryId == inventoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, facilityId.hashCode);
    hash = _SystemHash.combine(hash, inventoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateFacilityRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `facilityId` of this provider.
  String get facilityId;

  /// The parameter `inventoryId` of this provider.
  String get inventoryId;
}

class _CreateFacilityProviderElement
    extends AutoDisposeFutureProviderElement<bool> with CreateFacilityRef {
  _CreateFacilityProviderElement(super.provider);

  @override
  String get facilityId => (origin as CreateFacilityProvider).facilityId;
  @override
  String get inventoryId => (origin as CreateFacilityProvider).inventoryId;
}

String _$assignNationalUserToFacilityHash() =>
    r'db241d97324b74b277dc54e724828eedb26319d5';

/// See also [assignNationalUserToFacility].
@ProviderFor(assignNationalUserToFacility)
const assignNationalUserToFacilityProvider =
    AssignNationalUserToFacilityFamily();

/// See also [assignNationalUserToFacility].
class AssignNationalUserToFacilityFamily extends Family<AsyncValue<bool>> {
  /// See also [assignNationalUserToFacility].
  const AssignNationalUserToFacilityFamily();

  /// See also [assignNationalUserToFacility].
  AssignNationalUserToFacilityProvider call(
    Map<String, dynamic> body,
  ) {
    return AssignNationalUserToFacilityProvider(
      body,
    );
  }

  @override
  AssignNationalUserToFacilityProvider getProviderOverride(
    covariant AssignNationalUserToFacilityProvider provider,
  ) {
    return call(
      provider.body,
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
  String? get name => r'assignNationalUserToFacilityProvider';
}

/// See also [assignNationalUserToFacility].
class AssignNationalUserToFacilityProvider
    extends AutoDisposeFutureProvider<bool> {
  /// See also [assignNationalUserToFacility].
  AssignNationalUserToFacilityProvider(
    Map<String, dynamic> body,
  ) : this._internal(
          (ref) => assignNationalUserToFacility(
            ref as AssignNationalUserToFacilityRef,
            body,
          ),
          from: assignNationalUserToFacilityProvider,
          name: r'assignNationalUserToFacilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$assignNationalUserToFacilityHash,
          dependencies: AssignNationalUserToFacilityFamily._dependencies,
          allTransitiveDependencies:
              AssignNationalUserToFacilityFamily._allTransitiveDependencies,
          body: body,
        );

  AssignNationalUserToFacilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.body,
  }) : super.internal();

  final Map<String, dynamic> body;

  @override
  Override overrideWith(
    FutureOr<bool> Function(AssignNationalUserToFacilityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AssignNationalUserToFacilityProvider._internal(
        (ref) => create(ref as AssignNationalUserToFacilityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        body: body,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _AssignNationalUserToFacilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssignNationalUserToFacilityProvider && other.body == body;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AssignNationalUserToFacilityRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `body` of this provider.
  Map<String, dynamic> get body;
}

class _AssignNationalUserToFacilityProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with AssignNationalUserToFacilityRef {
  _AssignNationalUserToFacilityProviderElement(super.provider);

  @override
  Map<String, dynamic> get body =>
      (origin as AssignNationalUserToFacilityProvider).body;
}

String _$assignUserToFacilityHash() =>
    r'38d9a075ebd265516ac0252661c66970ca3f9a69';

/// See also [assignUserToFacility].
@ProviderFor(assignUserToFacility)
const assignUserToFacilityProvider = AssignUserToFacilityFamily();

/// See also [assignUserToFacility].
class AssignUserToFacilityFamily extends Family<AsyncValue<bool>> {
  /// See also [assignUserToFacility].
  const AssignUserToFacilityFamily();

  /// See also [assignUserToFacility].
  AssignUserToFacilityProvider call(
    String facilityId,
    String userId,
    bool microscopist,
  ) {
    return AssignUserToFacilityProvider(
      facilityId,
      userId,
      microscopist,
    );
  }

  @override
  AssignUserToFacilityProvider getProviderOverride(
    covariant AssignUserToFacilityProvider provider,
  ) {
    return call(
      provider.facilityId,
      provider.userId,
      provider.microscopist,
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
  String? get name => r'assignUserToFacilityProvider';
}

/// See also [assignUserToFacility].
class AssignUserToFacilityProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [assignUserToFacility].
  AssignUserToFacilityProvider(
    String facilityId,
    String userId,
    bool microscopist,
  ) : this._internal(
          (ref) => assignUserToFacility(
            ref as AssignUserToFacilityRef,
            facilityId,
            userId,
            microscopist,
          ),
          from: assignUserToFacilityProvider,
          name: r'assignUserToFacilityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$assignUserToFacilityHash,
          dependencies: AssignUserToFacilityFamily._dependencies,
          allTransitiveDependencies:
              AssignUserToFacilityFamily._allTransitiveDependencies,
          facilityId: facilityId,
          userId: userId,
          microscopist: microscopist,
        );

  AssignUserToFacilityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.facilityId,
    required this.userId,
    required this.microscopist,
  }) : super.internal();

  final String facilityId;
  final String userId;
  final bool microscopist;

  @override
  Override overrideWith(
    FutureOr<bool> Function(AssignUserToFacilityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AssignUserToFacilityProvider._internal(
        (ref) => create(ref as AssignUserToFacilityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        facilityId: facilityId,
        userId: userId,
        microscopist: microscopist,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _AssignUserToFacilityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssignUserToFacilityProvider &&
        other.facilityId == facilityId &&
        other.userId == userId &&
        other.microscopist == microscopist;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, facilityId.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, microscopist.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AssignUserToFacilityRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `facilityId` of this provider.
  String get facilityId;

  /// The parameter `userId` of this provider.
  String get userId;

  /// The parameter `microscopist` of this provider.
  bool get microscopist;
}

class _AssignUserToFacilityProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with AssignUserToFacilityRef {
  _AssignUserToFacilityProviderElement(super.provider);

  @override
  String get facilityId => (origin as AssignUserToFacilityProvider).facilityId;
  @override
  String get userId => (origin as AssignUserToFacilityProvider).userId;
  @override
  bool get microscopist =>
      (origin as AssignUserToFacilityProvider).microscopist;
}

String _$getUsersHash() => r'5fc6166f935210a0c932abb30e8273a1f591bf4f';

/// See also [getUsers].
@ProviderFor(getUsers)
final getUsersProvider = AutoDisposeFutureProvider<void>.internal(
  getUsers,
  name: r'getUsersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUsersRef = AutoDisposeFutureProviderRef<void>;
String _$createFacilityTrainingHash() =>
    r'd5606640016d7f0429b4cea79e122219727877f3';

/// See also [createFacilityTraining].
@ProviderFor(createFacilityTraining)
const createFacilityTrainingProvider = CreateFacilityTrainingFamily();

/// See also [createFacilityTraining].
class CreateFacilityTrainingFamily extends Family<AsyncValue<bool>> {
  /// See also [createFacilityTraining].
  const CreateFacilityTrainingFamily();

  /// See also [createFacilityTraining].
  CreateFacilityTrainingProvider call(
    String facilityId,
  ) {
    return CreateFacilityTrainingProvider(
      facilityId,
    );
  }

  @override
  CreateFacilityTrainingProvider getProviderOverride(
    covariant CreateFacilityTrainingProvider provider,
  ) {
    return call(
      provider.facilityId,
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
  String? get name => r'createFacilityTrainingProvider';
}

/// See also [createFacilityTraining].
class CreateFacilityTrainingProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [createFacilityTraining].
  CreateFacilityTrainingProvider(
    String facilityId,
  ) : this._internal(
          (ref) => createFacilityTraining(
            ref as CreateFacilityTrainingRef,
            facilityId,
          ),
          from: createFacilityTrainingProvider,
          name: r'createFacilityTrainingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createFacilityTrainingHash,
          dependencies: CreateFacilityTrainingFamily._dependencies,
          allTransitiveDependencies:
              CreateFacilityTrainingFamily._allTransitiveDependencies,
          facilityId: facilityId,
        );

  CreateFacilityTrainingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.facilityId,
  }) : super.internal();

  final String facilityId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CreateFacilityTrainingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateFacilityTrainingProvider._internal(
        (ref) => create(ref as CreateFacilityTrainingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        facilityId: facilityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CreateFacilityTrainingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateFacilityTrainingProvider &&
        other.facilityId == facilityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, facilityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateFacilityTrainingRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `facilityId` of this provider.
  String get facilityId;
}

class _CreateFacilityTrainingProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with CreateFacilityTrainingRef {
  _CreateFacilityTrainingProviderElement(super.provider);

  @override
  String get facilityId =>
      (origin as CreateFacilityTrainingProvider).facilityId;
}

String _$createStaffTrainingHash() =>
    r'2b89fe3fc2c5b7799fdfd58d31b4000996201757';

/// See also [createStaffTraining].
@ProviderFor(createStaffTraining)
const createStaffTrainingProvider = CreateStaffTrainingFamily();

/// See also [createStaffTraining].
class CreateStaffTrainingFamily extends Family<AsyncValue<bool>> {
  /// See also [createStaffTraining].
  const CreateStaffTrainingFamily();

  /// See also [createStaffTraining].
  CreateStaffTrainingProvider call(
    String microscopistId,
  ) {
    return CreateStaffTrainingProvider(
      microscopistId,
    );
  }

  @override
  CreateStaffTrainingProvider getProviderOverride(
    covariant CreateStaffTrainingProvider provider,
  ) {
    return call(
      provider.microscopistId,
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
  String? get name => r'createStaffTrainingProvider';
}

/// See also [createStaffTraining].
class CreateStaffTrainingProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [createStaffTraining].
  CreateStaffTrainingProvider(
    String microscopistId,
  ) : this._internal(
          (ref) => createStaffTraining(
            ref as CreateStaffTrainingRef,
            microscopistId,
          ),
          from: createStaffTrainingProvider,
          name: r'createStaffTrainingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createStaffTrainingHash,
          dependencies: CreateStaffTrainingFamily._dependencies,
          allTransitiveDependencies:
              CreateStaffTrainingFamily._allTransitiveDependencies,
          microscopistId: microscopistId,
        );

  CreateStaffTrainingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.microscopistId,
  }) : super.internal();

  final String microscopistId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CreateStaffTrainingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateStaffTrainingProvider._internal(
        (ref) => create(ref as CreateStaffTrainingRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        microscopistId: microscopistId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CreateStaffTrainingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateStaffTrainingProvider &&
        other.microscopistId == microscopistId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, microscopistId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateStaffTrainingRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `microscopistId` of this provider.
  String get microscopistId;
}

class _CreateStaffTrainingProviderElement
    extends AutoDisposeFutureProviderElement<bool> with CreateStaffTrainingRef {
  _CreateStaffTrainingProviderElement(super.provider);

  @override
  String get microscopistId =>
      (origin as CreateStaffTrainingProvider).microscopistId;
}

String _$createNationalUserHash() =>
    r'efb37db9d4590bc76c5bf5b6bc7de64a6de9eb5d';

/// See also [createNationalUser].
@ProviderFor(createNationalUser)
const createNationalUserProvider = CreateNationalUserFamily();

/// See also [createNationalUser].
class CreateNationalUserFamily extends Family<AsyncValue<bool>> {
  /// See also [createNationalUser].
  const CreateNationalUserFamily();

  /// See also [createNationalUser].
  CreateNationalUserProvider call(
    Map<String, dynamic> user,
  ) {
    return CreateNationalUserProvider(
      user,
    );
  }

  @override
  CreateNationalUserProvider getProviderOverride(
    covariant CreateNationalUserProvider provider,
  ) {
    return call(
      provider.user,
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
  String? get name => r'createNationalUserProvider';
}

/// See also [createNationalUser].
class CreateNationalUserProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [createNationalUser].
  CreateNationalUserProvider(
    Map<String, dynamic> user,
  ) : this._internal(
          (ref) => createNationalUser(
            ref as CreateNationalUserRef,
            user,
          ),
          from: createNationalUserProvider,
          name: r'createNationalUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createNationalUserHash,
          dependencies: CreateNationalUserFamily._dependencies,
          allTransitiveDependencies:
              CreateNationalUserFamily._allTransitiveDependencies,
          user: user,
        );

  CreateNationalUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
  }) : super.internal();

  final Map<String, dynamic> user;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CreateNationalUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateNationalUserProvider._internal(
        (ref) => create(ref as CreateNationalUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CreateNationalUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateNationalUserProvider && other.user == user;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateNationalUserRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `user` of this provider.
  Map<String, dynamic> get user;
}

class _CreateNationalUserProviderElement
    extends AutoDisposeFutureProviderElement<bool> with CreateNationalUserRef {
  _CreateNationalUserProviderElement(super.provider);

  @override
  Map<String, dynamic> get user => (origin as CreateNationalUserProvider).user;
}

String _$createUserHash() => r'cb7a2b7e0389faf95456a37666b475a97d59d167';

/// See also [createUser].
@ProviderFor(createUser)
const createUserProvider = CreateUserFamily();

/// See also [createUser].
class CreateUserFamily extends Family<AsyncValue<bool>> {
  /// See also [createUser].
  const CreateUserFamily();

  /// See also [createUser].
  CreateUserProvider call(
    bool microscopy,
    String userId,
  ) {
    return CreateUserProvider(
      microscopy,
      userId,
    );
  }

  @override
  CreateUserProvider getProviderOverride(
    covariant CreateUserProvider provider,
  ) {
    return call(
      provider.microscopy,
      provider.userId,
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
  String? get name => r'createUserProvider';
}

/// See also [createUser].
class CreateUserProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [createUser].
  CreateUserProvider(
    bool microscopy,
    String userId,
  ) : this._internal(
          (ref) => createUser(
            ref as CreateUserRef,
            microscopy,
            userId,
          ),
          from: createUserProvider,
          name: r'createUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createUserHash,
          dependencies: CreateUserFamily._dependencies,
          allTransitiveDependencies:
              CreateUserFamily._allTransitiveDependencies,
          microscopy: microscopy,
          userId: userId,
        );

  CreateUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.microscopy,
    required this.userId,
  }) : super.internal();

  final bool microscopy;
  final String userId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CreateUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateUserProvider._internal(
        (ref) => create(ref as CreateUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        microscopy: microscopy,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CreateUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateUserProvider &&
        other.microscopy == microscopy &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, microscopy.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateUserRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `microscopy` of this provider.
  bool get microscopy;

  /// The parameter `userId` of this provider.
  String get userId;
}

class _CreateUserProviderElement extends AutoDisposeFutureProviderElement<bool>
    with CreateUserRef {
  _CreateUserProviderElement(super.provider);

  @override
  bool get microscopy => (origin as CreateUserProvider).microscopy;
  @override
  String get userId => (origin as CreateUserProvider).userId;
}

String _$configureHash() => r'07c4244e2a73564d72c116f6ac53487988d6c0d2';

/// See also [configure].
@ProviderFor(configure)
final configureProvider = AutoDisposeFutureProvider<void>.internal(
  configure,
  name: r'configureProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$configureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConfigureRef = AutoDisposeFutureProviderRef<void>;
String _$createNewProductHash() => r'575b1c7e407ec66d22c04c6fced222aad06c2b08';

/// See also [createNewProduct].
@ProviderFor(createNewProduct)
const createNewProductProvider = CreateNewProductFamily();

/// See also [createNewProduct].
class CreateNewProductFamily extends Family<AsyncValue<void>> {
  /// See also [createNewProduct].
  const CreateNewProductFamily();

  /// See also [createNewProduct].
  CreateNewProductProvider call(
    Map<String, dynamic> product,
  ) {
    return CreateNewProductProvider(
      product,
    );
  }

  @override
  CreateNewProductProvider getProviderOverride(
    covariant CreateNewProductProvider provider,
  ) {
    return call(
      provider.product,
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
  String? get name => r'createNewProductProvider';
}

/// See also [createNewProduct].
class CreateNewProductProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createNewProduct].
  CreateNewProductProvider(
    Map<String, dynamic> product,
  ) : this._internal(
          (ref) => createNewProduct(
            ref as CreateNewProductRef,
            product,
          ),
          from: createNewProductProvider,
          name: r'createNewProductProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createNewProductHash,
          dependencies: CreateNewProductFamily._dependencies,
          allTransitiveDependencies:
              CreateNewProductFamily._allTransitiveDependencies,
          product: product,
        );

  CreateNewProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
  }) : super.internal();

  final Map<String, dynamic> product;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateNewProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateNewProductProvider._internal(
        (ref) => create(ref as CreateNewProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateNewProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateNewProductProvider && other.product == product;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateNewProductRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `product` of this provider.
  Map<String, dynamic> get product;
}

class _CreateNewProductProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateNewProductRef {
  _CreateNewProductProviderElement(super.provider);

  @override
  Map<String, dynamic> get product =>
      (origin as CreateNewProductProvider).product;
}

String _$addProductsToNationalInventoryHash() =>
    r'1325536eb962be0b74ddfd536d10a6eca06685cf';

/// See also [addProductsToNationalInventory].
@ProviderFor(addProductsToNationalInventory)
const addProductsToNationalInventoryProvider =
    AddProductsToNationalInventoryFamily();

/// See also [addProductsToNationalInventory].
class AddProductsToNationalInventoryFamily extends Family<AsyncValue<void>> {
  /// See also [addProductsToNationalInventory].
  const AddProductsToNationalInventoryFamily();

  /// See also [addProductsToNationalInventory].
  AddProductsToNationalInventoryProvider call(
    String warehouseId,
    List<dynamic> products,
    String inventoryId,
  ) {
    return AddProductsToNationalInventoryProvider(
      warehouseId,
      products,
      inventoryId,
    );
  }

  @override
  AddProductsToNationalInventoryProvider getProviderOverride(
    covariant AddProductsToNationalInventoryProvider provider,
  ) {
    return call(
      provider.warehouseId,
      provider.products,
      provider.inventoryId,
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
  String? get name => r'addProductsToNationalInventoryProvider';
}

/// See also [addProductsToNationalInventory].
class AddProductsToNationalInventoryProvider
    extends AutoDisposeFutureProvider<void> {
  /// See also [addProductsToNationalInventory].
  AddProductsToNationalInventoryProvider(
    String warehouseId,
    List<dynamic> products,
    String inventoryId,
  ) : this._internal(
          (ref) => addProductsToNationalInventory(
            ref as AddProductsToNationalInventoryRef,
            warehouseId,
            products,
            inventoryId,
          ),
          from: addProductsToNationalInventoryProvider,
          name: r'addProductsToNationalInventoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addProductsToNationalInventoryHash,
          dependencies: AddProductsToNationalInventoryFamily._dependencies,
          allTransitiveDependencies:
              AddProductsToNationalInventoryFamily._allTransitiveDependencies,
          warehouseId: warehouseId,
          products: products,
          inventoryId: inventoryId,
        );

  AddProductsToNationalInventoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.warehouseId,
    required this.products,
    required this.inventoryId,
  }) : super.internal();

  final String warehouseId;
  final List<dynamic> products;
  final String inventoryId;

  @override
  Override overrideWith(
    FutureOr<void> Function(AddProductsToNationalInventoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddProductsToNationalInventoryProvider._internal(
        (ref) => create(ref as AddProductsToNationalInventoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        warehouseId: warehouseId,
        products: products,
        inventoryId: inventoryId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AddProductsToNationalInventoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddProductsToNationalInventoryProvider &&
        other.warehouseId == warehouseId &&
        other.products == products &&
        other.inventoryId == inventoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, warehouseId.hashCode);
    hash = _SystemHash.combine(hash, products.hashCode);
    hash = _SystemHash.combine(hash, inventoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddProductsToNationalInventoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `warehouseId` of this provider.
  String get warehouseId;

  /// The parameter `products` of this provider.
  List<dynamic> get products;

  /// The parameter `inventoryId` of this provider.
  String get inventoryId;
}

class _AddProductsToNationalInventoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with AddProductsToNationalInventoryRef {
  _AddProductsToNationalInventoryProviderElement(super.provider);

  @override
  String get warehouseId =>
      (origin as AddProductsToNationalInventoryProvider).warehouseId;
  @override
  List<dynamic> get products =>
      (origin as AddProductsToNationalInventoryProvider).products;
  @override
  String get inventoryId =>
      (origin as AddProductsToNationalInventoryProvider).inventoryId;
}

String _$getInventoryHash() => r'a7418d9baa3eebd5e04543d7517f505a1bc510f3';

/// See also [getInventory].
@ProviderFor(getInventory)
const getInventoryProvider = GetInventoryFamily();

/// See also [getInventory].
class GetInventoryFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [getInventory].
  const GetInventoryFamily();

  /// See also [getInventory].
  GetInventoryProvider call(
    String facilityId,
  ) {
    return GetInventoryProvider(
      facilityId,
    );
  }

  @override
  GetInventoryProvider getProviderOverride(
    covariant GetInventoryProvider provider,
  ) {
    return call(
      provider.facilityId,
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
  String? get name => r'getInventoryProvider';
}

/// See also [getInventory].
class GetInventoryProvider extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [getInventory].
  GetInventoryProvider(
    String facilityId,
  ) : this._internal(
          (ref) => getInventory(
            ref as GetInventoryRef,
            facilityId,
          ),
          from: getInventoryProvider,
          name: r'getInventoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getInventoryHash,
          dependencies: GetInventoryFamily._dependencies,
          allTransitiveDependencies:
              GetInventoryFamily._allTransitiveDependencies,
          facilityId: facilityId,
        );

  GetInventoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.facilityId,
  }) : super.internal();

  final String facilityId;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(GetInventoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetInventoryProvider._internal(
        (ref) => create(ref as GetInventoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        facilityId: facilityId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _GetInventoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetInventoryProvider && other.facilityId == facilityId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, facilityId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetInventoryRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `facilityId` of this provider.
  String get facilityId;
}

class _GetInventoryProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with GetInventoryRef {
  _GetInventoryProviderElement(super.provider);

  @override
  String get facilityId => (origin as GetInventoryProvider).facilityId;
}

String _$testerHash() => r'381ee77678cfbf3e7518ec72af9cc8e5d5e8fe20';

/// See also [tester].
@ProviderFor(tester)
final testerProvider = AutoDisposeFutureProvider<Object?>.internal(
  tester,
  name: r'testerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$testerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TesterRef = AutoDisposeFutureProviderRef<Object?>;
String _$createSupplyHash() => r'c7c807838e421748df1dc35a82549441a8270054';

/// See also [createSupply].
@ProviderFor(createSupply)
const createSupplyProvider = CreateSupplyFamily();

/// See also [createSupply].
class CreateSupplyFamily extends Family<AsyncValue<void>> {
  /// See also [createSupply].
  const CreateSupplyFamily();

  /// See also [createSupply].
  CreateSupplyProvider call(
    Map<String, dynamic> data,
  ) {
    return CreateSupplyProvider(
      data,
    );
  }

  @override
  CreateSupplyProvider getProviderOverride(
    covariant CreateSupplyProvider provider,
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
  String? get name => r'createSupplyProvider';
}

/// See also [createSupply].
class CreateSupplyProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createSupply].
  CreateSupplyProvider(
    Map<String, dynamic> data,
  ) : this._internal(
          (ref) => createSupply(
            ref as CreateSupplyRef,
            data,
          ),
          from: createSupplyProvider,
          name: r'createSupplyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createSupplyHash,
          dependencies: CreateSupplyFamily._dependencies,
          allTransitiveDependencies:
              CreateSupplyFamily._allTransitiveDependencies,
          data: data,
        );

  CreateSupplyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
  }) : super.internal();

  final Map<String, dynamic> data;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateSupplyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateSupplyProvider._internal(
        (ref) => create(ref as CreateSupplyRef),
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
    return _CreateSupplyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateSupplyProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateSupplyRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `data` of this provider.
  Map<String, dynamic> get data;
}

class _CreateSupplyProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateSupplyRef {
  _CreateSupplyProviderElement(super.provider);

  @override
  Map<String, dynamic> get data => (origin as CreateSupplyProvider).data;
}

String _$createTestUsersHash() => r'61f4850ce2de828def1d536f522d35c99815389e';

/// See also [createTestUsers].
@ProviderFor(createTestUsers)
final createTestUsersProvider = AutoDisposeFutureProvider<void>.internal(
  createTestUsers,
  name: r'createTestUsersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createTestUsersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CreateTestUsersRef = AutoDisposeFutureProviderRef<void>;
String _$createProductsAndAddHash() =>
    r'0256e99f4b2f933d531fc12e1995bec17c189c35';

/// See also [createProductsAndAdd].
@ProviderFor(createProductsAndAdd)
final createProductsAndAddProvider = AutoDisposeFutureProvider<void>.internal(
  createProductsAndAdd,
  name: r'createProductsAndAddProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$createProductsAndAddHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CreateProductsAndAddRef = AutoDisposeFutureProviderRef<void>;
String _$updateInventoryHash() => r'c8a3619ecdda10d8e5cd9126fe60c4091faa20b9';

/// See also [updateInventory].
@ProviderFor(updateInventory)
const updateInventoryProvider = UpdateInventoryFamily();

/// See also [updateInventory].
class UpdateInventoryFamily extends Family<AsyncValue<void>> {
  /// See also [updateInventory].
  const UpdateInventoryFamily();

  /// See also [updateInventory].
  UpdateInventoryProvider call(
    int quantity,
    String expiry,
    String batch,
    int stockBalance,
  ) {
    return UpdateInventoryProvider(
      quantity,
      expiry,
      batch,
      stockBalance,
    );
  }

  @override
  UpdateInventoryProvider getProviderOverride(
    covariant UpdateInventoryProvider provider,
  ) {
    return call(
      provider.quantity,
      provider.expiry,
      provider.batch,
      provider.stockBalance,
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
  String? get name => r'updateInventoryProvider';
}

/// See also [updateInventory].
class UpdateInventoryProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateInventory].
  UpdateInventoryProvider(
    int quantity,
    String expiry,
    String batch,
    int stockBalance,
  ) : this._internal(
          (ref) => updateInventory(
            ref as UpdateInventoryRef,
            quantity,
            expiry,
            batch,
            stockBalance,
          ),
          from: updateInventoryProvider,
          name: r'updateInventoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateInventoryHash,
          dependencies: UpdateInventoryFamily._dependencies,
          allTransitiveDependencies:
              UpdateInventoryFamily._allTransitiveDependencies,
          quantity: quantity,
          expiry: expiry,
          batch: batch,
          stockBalance: stockBalance,
        );

  UpdateInventoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.quantity,
    required this.expiry,
    required this.batch,
    required this.stockBalance,
  }) : super.internal();

  final int quantity;
  final String expiry;
  final String batch;
  final int stockBalance;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateInventoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateInventoryProvider._internal(
        (ref) => create(ref as UpdateInventoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        quantity: quantity,
        expiry: expiry,
        batch: batch,
        stockBalance: stockBalance,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateInventoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateInventoryProvider &&
        other.quantity == quantity &&
        other.expiry == expiry &&
        other.batch == batch &&
        other.stockBalance == stockBalance;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, quantity.hashCode);
    hash = _SystemHash.combine(hash, expiry.hashCode);
    hash = _SystemHash.combine(hash, batch.hashCode);
    hash = _SystemHash.combine(hash, stockBalance.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateInventoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `quantity` of this provider.
  int get quantity;

  /// The parameter `expiry` of this provider.
  String get expiry;

  /// The parameter `batch` of this provider.
  String get batch;

  /// The parameter `stockBalance` of this provider.
  int get stockBalance;
}

class _UpdateInventoryProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateInventoryRef {
  _UpdateInventoryProviderElement(super.provider);

  @override
  int get quantity => (origin as UpdateInventoryProvider).quantity;
  @override
  String get expiry => (origin as UpdateInventoryProvider).expiry;
  @override
  String get batch => (origin as UpdateInventoryProvider).batch;
  @override
  int get stockBalance => (origin as UpdateInventoryProvider).stockBalance;
}

String _$sendProductsHash() => r'433bc4fe2e8c76b89c82d219f6d491995cc76952';

/// See also [sendProducts].
@ProviderFor(sendProducts)
const sendProductsProvider = SendProductsFamily();

/// See also [sendProducts].
class SendProductsFamily extends Family<AsyncValue<void>> {
  /// See also [sendProducts].
  const SendProductsFamily();

  /// See also [sendProducts].
  SendProductsProvider call(
    String receiver,
    String sender,
    List<Map<String, dynamic>> data,
  ) {
    return SendProductsProvider(
      receiver,
      sender,
      data,
    );
  }

  @override
  SendProductsProvider getProviderOverride(
    covariant SendProductsProvider provider,
  ) {
    return call(
      provider.receiver,
      provider.sender,
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
  String? get name => r'sendProductsProvider';
}

/// See also [sendProducts].
class SendProductsProvider extends AutoDisposeFutureProvider<void> {
  /// See also [sendProducts].
  SendProductsProvider(
    String receiver,
    String sender,
    List<Map<String, dynamic>> data,
  ) : this._internal(
          (ref) => sendProducts(
            ref as SendProductsRef,
            receiver,
            sender,
            data,
          ),
          from: sendProductsProvider,
          name: r'sendProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendProductsHash,
          dependencies: SendProductsFamily._dependencies,
          allTransitiveDependencies:
              SendProductsFamily._allTransitiveDependencies,
          receiver: receiver,
          sender: sender,
          data: data,
        );

  SendProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.receiver,
    required this.sender,
    required this.data,
  }) : super.internal();

  final String receiver;
  final String sender;
  final List<Map<String, dynamic>> data;

  @override
  Override overrideWith(
    FutureOr<void> Function(SendProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SendProductsProvider._internal(
        (ref) => create(ref as SendProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        receiver: receiver,
        sender: sender,
        data: data,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SendProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendProductsProvider &&
        other.receiver == receiver &&
        other.sender == sender &&
        other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, receiver.hashCode);
    hash = _SystemHash.combine(hash, sender.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendProductsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `receiver` of this provider.
  String get receiver;

  /// The parameter `sender` of this provider.
  String get sender;

  /// The parameter `data` of this provider.
  List<Map<String, dynamic>> get data;
}

class _SendProductsProviderElement
    extends AutoDisposeFutureProviderElement<void> with SendProductsRef {
  _SendProductsProviderElement(super.provider);

  @override
  String get receiver => (origin as SendProductsProvider).receiver;
  @override
  String get sender => (origin as SendProductsProvider).sender;
  @override
  List<Map<String, dynamic>> get data => (origin as SendProductsProvider).data;
}

String _$getPendingDeliveryHash() =>
    r'761ed42bd538e9935668464f476bddd21f74bc36';

/// See also [getPendingDelivery].
@ProviderFor(getPendingDelivery)
const getPendingDeliveryProvider = GetPendingDeliveryFamily();

/// See also [getPendingDelivery].
class GetPendingDeliveryFamily extends Family<AsyncValue<List<dynamic>>> {
  /// See also [getPendingDelivery].
  const GetPendingDeliveryFamily();

  /// See also [getPendingDelivery].
  GetPendingDeliveryProvider call(
    String id,
  ) {
    return GetPendingDeliveryProvider(
      id,
    );
  }

  @override
  GetPendingDeliveryProvider getProviderOverride(
    covariant GetPendingDeliveryProvider provider,
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
  String? get name => r'getPendingDeliveryProvider';
}

/// See also [getPendingDelivery].
class GetPendingDeliveryProvider
    extends AutoDisposeFutureProvider<List<dynamic>> {
  /// See also [getPendingDelivery].
  GetPendingDeliveryProvider(
    String id,
  ) : this._internal(
          (ref) => getPendingDelivery(
            ref as GetPendingDeliveryRef,
            id,
          ),
          from: getPendingDeliveryProvider,
          name: r'getPendingDeliveryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPendingDeliveryHash,
          dependencies: GetPendingDeliveryFamily._dependencies,
          allTransitiveDependencies:
              GetPendingDeliveryFamily._allTransitiveDependencies,
          id: id,
        );

  GetPendingDeliveryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<List<dynamic>> Function(GetPendingDeliveryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPendingDeliveryProvider._internal(
        (ref) => create(ref as GetPendingDeliveryRef),
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
  AutoDisposeFutureProviderElement<List<dynamic>> createElement() {
    return _GetPendingDeliveryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPendingDeliveryProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPendingDeliveryRef on AutoDisposeFutureProviderRef<List<dynamic>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetPendingDeliveryProviderElement
    extends AutoDisposeFutureProviderElement<List<dynamic>>
    with GetPendingDeliveryRef {
  _GetPendingDeliveryProviderElement(super.provider);

  @override
  String get id => (origin as GetPendingDeliveryProvider).id;
}

String _$getAllSuppliesHash() => r'94f15623b106b92cf1ea429e88e0fc56cbd2faab';

/// See also [getAllSupplies].
@ProviderFor(getAllSupplies)
final getAllSuppliesProvider = AutoDisposeFutureProvider<Object?>.internal(
  getAllSupplies,
  name: r'getAllSuppliesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllSuppliesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllSuppliesRef = AutoDisposeFutureProviderRef<Object?>;
String _$confirmSuppliesHash() => r'9919432898473ddeaa8457f60f8592530fbcfb01';

/// See also [confirmSupplies].
@ProviderFor(confirmSupplies)
const confirmSuppliesProvider = ConfirmSuppliesFamily();

/// See also [confirmSupplies].
class ConfirmSuppliesFamily extends Family<AsyncValue<bool>> {
  /// See also [confirmSupplies].
  const ConfirmSuppliesFamily();

  /// See also [confirmSupplies].
  ConfirmSuppliesProvider call(
    Map<String, dynamic> data,
    List<Map<String, dynamic>> discrepancy,
  ) {
    return ConfirmSuppliesProvider(
      data,
      discrepancy,
    );
  }

  @override
  ConfirmSuppliesProvider getProviderOverride(
    covariant ConfirmSuppliesProvider provider,
  ) {
    return call(
      provider.data,
      provider.discrepancy,
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
  String? get name => r'confirmSuppliesProvider';
}

/// See also [confirmSupplies].
class ConfirmSuppliesProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [confirmSupplies].
  ConfirmSuppliesProvider(
    Map<String, dynamic> data,
    List<Map<String, dynamic>> discrepancy,
  ) : this._internal(
          (ref) => confirmSupplies(
            ref as ConfirmSuppliesRef,
            data,
            discrepancy,
          ),
          from: confirmSuppliesProvider,
          name: r'confirmSuppliesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$confirmSuppliesHash,
          dependencies: ConfirmSuppliesFamily._dependencies,
          allTransitiveDependencies:
              ConfirmSuppliesFamily._allTransitiveDependencies,
          data: data,
          discrepancy: discrepancy,
        );

  ConfirmSuppliesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.data,
    required this.discrepancy,
  }) : super.internal();

  final Map<String, dynamic> data;
  final List<Map<String, dynamic>> discrepancy;

  @override
  Override overrideWith(
    FutureOr<bool> Function(ConfirmSuppliesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConfirmSuppliesProvider._internal(
        (ref) => create(ref as ConfirmSuppliesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        data: data,
        discrepancy: discrepancy,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _ConfirmSuppliesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConfirmSuppliesProvider &&
        other.data == data &&
        other.discrepancy == discrepancy;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);
    hash = _SystemHash.combine(hash, discrepancy.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ConfirmSuppliesRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `data` of this provider.
  Map<String, dynamic> get data;

  /// The parameter `discrepancy` of this provider.
  List<Map<String, dynamic>> get discrepancy;
}

class _ConfirmSuppliesProviderElement
    extends AutoDisposeFutureProviderElement<bool> with ConfirmSuppliesRef {
  _ConfirmSuppliesProviderElement(super.provider);

  @override
  Map<String, dynamic> get data => (origin as ConfirmSuppliesProvider).data;
  @override
  List<Map<String, dynamic>> get discrepancy =>
      (origin as ConfirmSuppliesProvider).discrepancy;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
