// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_payment_method_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DeletePaymentMethodStore on _DeletePaymentMethodStoreBase, Store {
  final _$paymentMethodIdAtom =
      Atom(name: '_DeletePaymentMethodStoreBase.paymentMethodId');

  @override
  int get paymentMethodId {
    _$paymentMethodIdAtom.reportRead();
    return super.paymentMethodId;
  }

  @override
  set paymentMethodId(int value) {
    _$paymentMethodIdAtom.reportWrite(value, super.paymentMethodId, () {
      super.paymentMethodId = value;
    });
  }

  final _$_DeletePaymentMethodStoreBaseActionController =
      ActionController(name: '_DeletePaymentMethodStoreBase');

  @override
  dynamic setPaymentMethodId(int value) {
    final _$actionInfo = _$_DeletePaymentMethodStoreBaseActionController
        .startAction(name: '_DeletePaymentMethodStoreBase.setPaymentMethodId');
    try {
      return super.setPaymentMethodId(value);
    } finally {
      _$_DeletePaymentMethodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
paymentMethodId: ${paymentMethodId}
    ''';
  }
}
