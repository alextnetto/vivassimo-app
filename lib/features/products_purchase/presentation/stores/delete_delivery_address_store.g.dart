// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_delivery_address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DeleteDeliveryAddressStore on _DeleteDeliveryAddressStoreBase, Store {
  final _$deliveryAddressIdAtom =
      Atom(name: '_DeleteDeliveryAddressStoreBase.deliveryAddressId');

  @override
  int get deliveryAddressId {
    _$deliveryAddressIdAtom.reportRead();
    return super.deliveryAddressId;
  }

  @override
  set deliveryAddressId(int value) {
    _$deliveryAddressIdAtom.reportWrite(value, super.deliveryAddressId, () {
      super.deliveryAddressId = value;
    });
  }

  final _$_DeleteDeliveryAddressStoreBaseActionController =
      ActionController(name: '_DeleteDeliveryAddressStoreBase');

  @override
  dynamic setDeliveryAddressId(int value) {
    final _$actionInfo =
        _$_DeleteDeliveryAddressStoreBaseActionController.startAction(
            name: '_DeleteDeliveryAddressStoreBase.setDeliveryAddressId');
    try {
      return super.setDeliveryAddressId(value);
    } finally {
      _$_DeleteDeliveryAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deliveryAddressId: ${deliveryAddressId}
    ''';
  }
}
