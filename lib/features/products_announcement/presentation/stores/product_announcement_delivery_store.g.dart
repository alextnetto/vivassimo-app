// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_announcement_delivery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductAnnouncementDeliveryStore
    on _ProductAnnouncementDeliveryStoreBase, Store {
  final _$deliveryTypeIdAtom =
      Atom(name: '_ProductAnnouncementDeliveryStoreBase.deliveryTypeId');

  @override
  int get deliveryTypeId {
    _$deliveryTypeIdAtom.reportRead();
    return super.deliveryTypeId;
  }

  @override
  set deliveryTypeId(int value) {
    _$deliveryTypeIdAtom.reportWrite(value, super.deliveryTypeId, () {
      super.deliveryTypeId = value;
    });
  }

  final _$_ProductAnnouncementDeliveryStoreBaseActionController =
      ActionController(name: '_ProductAnnouncementDeliveryStoreBase');

  @override
  dynamic setDeliveryTypeId(int value, String description) {
    final _$actionInfo =
        _$_ProductAnnouncementDeliveryStoreBaseActionController.startAction(
            name: '_ProductAnnouncementDeliveryStoreBase.setDeliveryTypeId');
    try {
      return super.setDeliveryTypeId(value, description);
    } finally {
      _$_ProductAnnouncementDeliveryStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deliveryTypeId: ${deliveryTypeId}
    ''';
  }
}
