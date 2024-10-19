// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchSummaryHash() => r'e088f5f7565c2395583c44e781eb9ac8ed6d940c';

/// See also [fetchSummary].
@ProviderFor(fetchSummary)
final fetchSummaryProvider = AutoDisposeFutureProvider<Summary>.internal(
  fetchSummary,
  name: r'fetchSummaryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchSummaryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchSummaryRef = AutoDisposeFutureProviderRef<Summary>;
String _$inventoryItemsHash() => r'13050e418e446d49de36909c0b6add78a6dc4284';

/// See also [InventoryItems].
@ProviderFor(InventoryItems)
final inventoryItemsProvider =
    AutoDisposeAsyncNotifierProvider<InventoryItems, InventoryGet>.internal(
  InventoryItems.new,
  name: r'inventoryItemsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inventoryItemsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$InventoryItems = AutoDisposeAsyncNotifier<InventoryGet>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
