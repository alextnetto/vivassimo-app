// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_method_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShippingMethodStore on _ShippingMethodStoreBase, Store {
  final _$shippingMethodTypeAtom =
      Atom(name: '_ShippingMethodStoreBase.shippingMethodType');

  @override
  String get shippingMethodType {
    _$shippingMethodTypeAtom.reportRead();
    return super.shippingMethodType;
  }

  @override
  set shippingMethodType(String value) {
    _$shippingMethodTypeAtom.reportWrite(value, super.shippingMethodType, () {
      super.shippingMethodType = value;
    });
  }

  final _$_ShippingMethodStoreBaseActionController =
      ActionController(name: '_ShippingMethodStoreBase');

  @override
  dynamic setShippingMethodType(String value) {
    final _$actionInfo = _$_ShippingMethodStoreBaseActionController.startAction(
        name: '_ShippingMethodStoreBase.setShippingMethodType');
    try {
      return super.setShippingMethodType(value);
    } finally {
      _$_ShippingMethodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shippingMethodType: ${shippingMethodType}
    ''';
  }
}
