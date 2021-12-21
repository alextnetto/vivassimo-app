// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DeliveryAddressStore on _DeliveryAddressStoreBase, Store {
  final _$selectedDeliveryAddressIdAtom =
      Atom(name: '_DeliveryAddressStoreBase.selectedDeliveryAddressId');

  @override
  int get selectedDeliveryAddressId {
    _$selectedDeliveryAddressIdAtom.reportRead();
    return super.selectedDeliveryAddressId;
  }

  @override
  set selectedDeliveryAddressId(int value) {
    _$selectedDeliveryAddressIdAtom
        .reportWrite(value, super.selectedDeliveryAddressId, () {
      super.selectedDeliveryAddressId = value;
    });
  }

  final _$deliveryAddressEntityAtom =
      Atom(name: '_DeliveryAddressStoreBase.deliveryAddressEntity');

  @override
  DeliveryAddressEntity? get deliveryAddressEntity {
    _$deliveryAddressEntityAtom.reportRead();
    return super.deliveryAddressEntity;
  }

  @override
  set deliveryAddressEntity(DeliveryAddressEntity? value) {
    _$deliveryAddressEntityAtom.reportWrite(value, super.deliveryAddressEntity,
        () {
      super.deliveryAddressEntity = value;
    });
  }

  final _$_DeliveryAddressStoreBaseActionController =
      ActionController(name: '_DeliveryAddressStoreBase');

  @override
  dynamic setSelectedDeliveryAddressId(int value) {
    final _$actionInfo =
        _$_DeliveryAddressStoreBaseActionController.startAction(
            name: '_DeliveryAddressStoreBase.setSelectedDeliveryAddressId');
    try {
      return super.setSelectedDeliveryAddressId(value);
    } finally {
      _$_DeliveryAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelectedDeliveryAddress(int value) {
    final _$actionInfo =
        _$_DeliveryAddressStoreBaseActionController.startAction(
            name: '_DeliveryAddressStoreBase.setSelectedDeliveryAddress');
    try {
      return super.setSelectedDeliveryAddress(value);
    } finally {
      _$_DeliveryAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addDeliveryAddress(DeliveryAddressEntity addressEntity) {
    final _$actionInfo = _$_DeliveryAddressStoreBaseActionController
        .startAction(name: '_DeliveryAddressStoreBase.addDeliveryAddress');
    try {
      return super.addDeliveryAddress(addressEntity);
    } finally {
      _$_DeliveryAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedDeliveryAddressId: ${selectedDeliveryAddressId},
deliveryAddressEntity: ${deliveryAddressEntity}
    ''';
  }
}
