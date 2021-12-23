// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_credit_card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewCreditCardStore on _NewCreditCardStoreBase, Store {
  Computed<String?>? _$getNumberErrorComputed;

  @override
  String? get getNumberError => (_$getNumberErrorComputed ??= Computed<String?>(
          () => super.getNumberError,
          name: '_NewCreditCardStoreBase.getNumberError'))
      .value;
  Computed<String?>? _$getNameErrorComputed;

  @override
  String? get getNameError =>
      (_$getNameErrorComputed ??= Computed<String?>(() => super.getNameError,
              name: '_NewCreditCardStoreBase.getNameError'))
          .value;
  Computed<String?>? _$getExpireDateErrorComputed;

  @override
  String? get getExpireDateError => (_$getExpireDateErrorComputed ??=
          Computed<String?>(() => super.getExpireDateError,
              name: '_NewCreditCardStoreBase.getExpireDateError'))
      .value;
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_NewCreditCardStoreBase.enableButton'))
          .value;

  final _$numberAtom = Atom(name: '_NewCreditCardStoreBase.number');

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  final _$hasChangedNumberAtom =
      Atom(name: '_NewCreditCardStoreBase.hasChangedNumber');

  @override
  bool get hasChangedNumber {
    _$hasChangedNumberAtom.reportRead();
    return super.hasChangedNumber;
  }

  @override
  set hasChangedNumber(bool value) {
    _$hasChangedNumberAtom.reportWrite(value, super.hasChangedNumber, () {
      super.hasChangedNumber = value;
    });
  }

  final _$nameAtom = Atom(name: '_NewCreditCardStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$hasChangedNameAtom =
      Atom(name: '_NewCreditCardStoreBase.hasChangedName');

  @override
  bool get hasChangedName {
    _$hasChangedNameAtom.reportRead();
    return super.hasChangedName;
  }

  @override
  set hasChangedName(bool value) {
    _$hasChangedNameAtom.reportWrite(value, super.hasChangedName, () {
      super.hasChangedName = value;
    });
  }

  final _$expireDateAtom = Atom(name: '_NewCreditCardStoreBase.expireDate');

  @override
  String get expireDate {
    _$expireDateAtom.reportRead();
    return super.expireDate;
  }

  @override
  set expireDate(String value) {
    _$expireDateAtom.reportWrite(value, super.expireDate, () {
      super.expireDate = value;
    });
  }

  final _$hasChangedExpireDateAtom =
      Atom(name: '_NewCreditCardStoreBase.hasChangedExpireDate');

  @override
  bool get hasChangedExpireDate {
    _$hasChangedExpireDateAtom.reportRead();
    return super.hasChangedExpireDate;
  }

  @override
  set hasChangedExpireDate(bool value) {
    _$hasChangedExpireDateAtom.reportWrite(value, super.hasChangedExpireDate,
        () {
      super.hasChangedExpireDate = value;
    });
  }

  final _$_NewCreditCardStoreBaseActionController =
      ActionController(name: '_NewCreditCardStoreBase');

  @override
  dynamic setNumber(String value) {
    final _$actionInfo = _$_NewCreditCardStoreBaseActionController.startAction(
        name: '_NewCreditCardStoreBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$_NewCreditCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_NewCreditCardStoreBaseActionController.startAction(
        name: '_NewCreditCardStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_NewCreditCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setExpireDate(String value) {
    final _$actionInfo = _$_NewCreditCardStoreBaseActionController.startAction(
        name: '_NewCreditCardStoreBase.setExpireDate');
    try {
      return super.setExpireDate(value);
    } finally {
      _$_NewCreditCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
number: ${number},
hasChangedNumber: ${hasChangedNumber},
name: ${name},
hasChangedName: ${hasChangedName},
expireDate: ${expireDate},
hasChangedExpireDate: ${hasChangedExpireDate},
getNumberError: ${getNumberError},
getNameError: ${getNameError},
getExpireDateError: ${getExpireDateError},
enableButton: ${enableButton}
    ''';
  }
}
