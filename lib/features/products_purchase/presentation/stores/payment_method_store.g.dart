// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentMethodStore on _PaymentMethodStoreBase, Store {
  Computed<num>? _$getInstallmentAmountComputed;

  @override
  num get getInstallmentAmount => (_$getInstallmentAmountComputed ??=
          Computed<num>(() => super.getInstallmentAmount,
              name: '_PaymentMethodStoreBase.getInstallmentAmount'))
      .value;
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_PaymentMethodStoreBase.enableButton'))
          .value;

  final _$creditCardSelectedAtom =
      Atom(name: '_PaymentMethodStoreBase.creditCardSelected');

  @override
  PaymentMethodEntity? get creditCardSelected {
    _$creditCardSelectedAtom.reportRead();
    return super.creditCardSelected;
  }

  @override
  set creditCardSelected(PaymentMethodEntity? value) {
    _$creditCardSelectedAtom.reportWrite(value, super.creditCardSelected, () {
      super.creditCardSelected = value;
    });
  }

  final _$purchaseValueAtom =
      Atom(name: '_PaymentMethodStoreBase.purchaseValue');

  @override
  num get purchaseValue {
    _$purchaseValueAtom.reportRead();
    return super.purchaseValue;
  }

  @override
  set purchaseValue(num value) {
    _$purchaseValueAtom.reportWrite(value, super.purchaseValue, () {
      super.purchaseValue = value;
    });
  }

  final _$installmentAtom = Atom(name: '_PaymentMethodStoreBase.installment');

  @override
  int get installment {
    _$installmentAtom.reportRead();
    return super.installment;
  }

  @override
  set installment(int value) {
    _$installmentAtom.reportWrite(value, super.installment, () {
      super.installment = value;
    });
  }

  final _$paymentMethodAtom =
      Atom(name: '_PaymentMethodStoreBase.paymentMethod');

  @override
  String get paymentMethod {
    _$paymentMethodAtom.reportRead();
    return super.paymentMethod;
  }

  @override
  set paymentMethod(String value) {
    _$paymentMethodAtom.reportWrite(value, super.paymentMethod, () {
      super.paymentMethod = value;
    });
  }

  final _$_PaymentMethodStoreBaseActionController =
      ActionController(name: '_PaymentMethodStoreBase');

  @override
  dynamic setPurchaseValue(num value) {
    final _$actionInfo = _$_PaymentMethodStoreBaseActionController.startAction(
        name: '_PaymentMethodStoreBase.setPurchaseValue');
    try {
      return super.setPurchaseValue(value);
    } finally {
      _$_PaymentMethodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic increaseInstallment() {
    final _$actionInfo = _$_PaymentMethodStoreBaseActionController.startAction(
        name: '_PaymentMethodStoreBase.increaseInstallment');
    try {
      return super.increaseInstallment();
    } finally {
      _$_PaymentMethodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic decreaseInstallment() {
    final _$actionInfo = _$_PaymentMethodStoreBaseActionController.startAction(
        name: '_PaymentMethodStoreBase.decreaseInstallment');
    try {
      return super.decreaseInstallment();
    } finally {
      _$_PaymentMethodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPaymentMethod(String value) {
    final _$actionInfo = _$_PaymentMethodStoreBaseActionController.startAction(
        name: '_PaymentMethodStoreBase.setPaymentMethod');
    try {
      return super.setPaymentMethod(value);
    } finally {
      _$_PaymentMethodStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
creditCardSelected: ${creditCardSelected},
purchaseValue: ${purchaseValue},
installment: ${installment},
paymentMethod: ${paymentMethod},
getInstallmentAmount: ${getInstallmentAmount},
enableButton: ${enableButton}
    ''';
  }
}
