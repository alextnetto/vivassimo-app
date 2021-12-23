// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_select_section_amount_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ServiceSelectSectionAmountStore
    on _ServiceSelectSectionAmountStoreBase, Store {
  Computed<String>? _$getSessionsAmountValueComputed;

  @override
  String get getSessionsAmountValue => (_$getSessionsAmountValueComputed ??=
          Computed<String>(() => super.getSessionsAmountValue,
              name:
                  '_ServiceSelectSectionAmountStoreBase.getSessionsAmountValue'))
      .value;
  Computed<String>? _$getInstallmentsAmountValueComputed;

  @override
  String get getInstallmentsAmountValue =>
      (_$getInstallmentsAmountValueComputed ??= Computed<String>(
              () => super.getInstallmentsAmountValue,
              name:
                  '_ServiceSelectSectionAmountStoreBase.getInstallmentsAmountValue'))
          .value;

  final _$serviceValueAtom =
      Atom(name: '_ServiceSelectSectionAmountStoreBase.serviceValue');

  @override
  num get serviceValue {
    _$serviceValueAtom.reportRead();
    return super.serviceValue;
  }

  @override
  set serviceValue(num value) {
    _$serviceValueAtom.reportWrite(value, super.serviceValue, () {
      super.serviceValue = value;
    });
  }

  final _$amountSessionsAtom =
      Atom(name: '_ServiceSelectSectionAmountStoreBase.amountSessions');

  @override
  int get amountSessions {
    _$amountSessionsAtom.reportRead();
    return super.amountSessions;
  }

  @override
  set amountSessions(int value) {
    _$amountSessionsAtom.reportWrite(value, super.amountSessions, () {
      super.amountSessions = value;
    });
  }

  final _$_ServiceSelectSectionAmountStoreBaseActionController =
      ActionController(name: '_ServiceSelectSectionAmountStoreBase');

  @override
  dynamic setServiceValue(num value) {
    final _$actionInfo =
        _$_ServiceSelectSectionAmountStoreBaseActionController.startAction(
            name: '_ServiceSelectSectionAmountStoreBase.setServiceValue');
    try {
      return super.setServiceValue(value);
    } finally {
      _$_ServiceSelectSectionAmountStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSessionsAmount(int value) {
    final _$actionInfo =
        _$_ServiceSelectSectionAmountStoreBaseActionController.startAction(
            name: '_ServiceSelectSectionAmountStoreBase.setSessionsAmount');
    try {
      return super.setSessionsAmount(value);
    } finally {
      _$_ServiceSelectSectionAmountStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic increaseInstallment() {
    final _$actionInfo =
        _$_ServiceSelectSectionAmountStoreBaseActionController.startAction(
            name: '_ServiceSelectSectionAmountStoreBase.increaseInstallment');
    try {
      return super.increaseInstallment();
    } finally {
      _$_ServiceSelectSectionAmountStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic decreaseInstallment() {
    final _$actionInfo =
        _$_ServiceSelectSectionAmountStoreBaseActionController.startAction(
            name: '_ServiceSelectSectionAmountStoreBase.decreaseInstallment');
    try {
      return super.decreaseInstallment();
    } finally {
      _$_ServiceSelectSectionAmountStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serviceValue: ${serviceValue},
amountSessions: ${amountSessions},
getSessionsAmountValue: ${getSessionsAmountValue},
getInstallmentsAmountValue: ${getInstallmentsAmountValue}
    ''';
  }
}
