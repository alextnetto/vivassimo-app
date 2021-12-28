// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_announcement_delivery_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductAnnouncementDeliveryStore
    on _ProductAnnouncementDeliveryStoreBase, Store {
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_ProductAnnouncementDeliveryStoreBase.enableButton'))
          .value;

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

  final _$isToSendByCorreiosAtom =
      Atom(name: '_ProductAnnouncementDeliveryStoreBase.isToSendByCorreios');

  @override
  bool get isToSendByCorreios {
    _$isToSendByCorreiosAtom.reportRead();
    return super.isToSendByCorreios;
  }

  @override
  set isToSendByCorreios(bool value) {
    _$isToSendByCorreiosAtom.reportWrite(value, super.isToSendByCorreios, () {
      super.isToSendByCorreios = value;
    });
  }

  final _$isToNegotiateWithBuyerAtom = Atom(
      name: '_ProductAnnouncementDeliveryStoreBase.isToNegotiateWithBuyer');

  @override
  bool get isToNegotiateWithBuyer {
    _$isToNegotiateWithBuyerAtom.reportRead();
    return super.isToNegotiateWithBuyer;
  }

  @override
  set isToNegotiateWithBuyer(bool value) {
    _$isToNegotiateWithBuyerAtom
        .reportWrite(value, super.isToNegotiateWithBuyer, () {
      super.isToNegotiateWithBuyer = value;
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
  dynamic setIsToSendByCorreios(bool value) {
    final _$actionInfo =
        _$_ProductAnnouncementDeliveryStoreBaseActionController.startAction(
            name:
                '_ProductAnnouncementDeliveryStoreBase.setIsToSendByCorreios');
    try {
      return super.setIsToSendByCorreios(value);
    } finally {
      _$_ProductAnnouncementDeliveryStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsToNegotiateWithBuyer(bool value) {
    final _$actionInfo =
        _$_ProductAnnouncementDeliveryStoreBaseActionController.startAction(
            name:
                '_ProductAnnouncementDeliveryStoreBase.setIsToNegotiateWithBuyer');
    try {
      return super.setIsToNegotiateWithBuyer(value);
    } finally {
      _$_ProductAnnouncementDeliveryStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
deliveryTypeId: ${deliveryTypeId},
isToSendByCorreios: ${isToSendByCorreios},
isToNegotiateWithBuyer: ${isToNegotiateWithBuyer},
enableButton: ${enableButton}
    ''';
  }
}
