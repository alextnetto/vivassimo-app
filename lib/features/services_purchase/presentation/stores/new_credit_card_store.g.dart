// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../core/shared_modules/credit_card/presentation/stores/new_credit_card_store.dart';

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
  Computed<String?>? _$getCvvErrorComputed;

  @override
  String? get getCvvError =>
      (_$getCvvErrorComputed ??= Computed<String?>(() => super.getCvvError,
              name: '_NewCreditCardStoreBase.getCvvError'))
          .value;
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_NewCreditCardStoreBase.enableButton'))
          .value;

  final _$showBackViewAtom = Atom(name: '_NewCreditCardStoreBase.showBackView');

  @override
  bool get showBackView {
    _$showBackViewAtom.reportRead();
    return super.showBackView;
  }

  @override
  set showBackView(bool value) {
    _$showBackViewAtom.reportWrite(value, super.showBackView, () {
      super.showBackView = value;
    });
  }

  final _$cardBrandAtom = Atom(name: '_NewCreditCardStoreBase.cardBrand');

  @override
  CardBrand get cardBrand {
    _$cardBrandAtom.reportRead();
    return super.cardBrand;
  }

  @override
  set cardBrand(CardBrand value) {
    _$cardBrandAtom.reportWrite(value, super.cardBrand, () {
      super.cardBrand = value;
    });
  }

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

  final _$ownerNameAtom = Atom(name: '_NewCreditCardStoreBase.ownerName');

  @override
  String get ownerName {
    _$ownerNameAtom.reportRead();
    return super.ownerName;
  }

  @override
  set ownerName(String value) {
    _$ownerNameAtom.reportWrite(value, super.ownerName, () {
      super.ownerName = value;
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

  final _$expirationDateAtom =
      Atom(name: '_NewCreditCardStoreBase.expirationDate');

  @override
  String get expirationDate {
    _$expirationDateAtom.reportRead();
    return super.expirationDate;
  }

  @override
  set expirationDate(String value) {
    _$expirationDateAtom.reportWrite(value, super.expirationDate, () {
      super.expirationDate = value;
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

  final _$cvvAtom = Atom(name: '_NewCreditCardStoreBase.cvv');

  @override
  String get cvv {
    _$cvvAtom.reportRead();
    return super.cvv;
  }

  @override
  set cvv(String value) {
    _$cvvAtom.reportWrite(value, super.cvv, () {
      super.cvv = value;
    });
  }

  final _$hasChangedCvvAtom =
      Atom(name: '_NewCreditCardStoreBase.hasChangedCvv');

  @override
  bool get hasChangedCvv {
    _$hasChangedCvvAtom.reportRead();
    return super.hasChangedCvv;
  }

  @override
  set hasChangedCvv(bool value) {
    _$hasChangedCvvAtom.reportWrite(value, super.hasChangedCvv, () {
      super.hasChangedCvv = value;
    });
  }

  final _$_NewCreditCardStoreBaseActionController =
      ActionController(name: '_NewCreditCardStoreBase');

  @override
  dynamic setShowBackView(bool value) {
    final _$actionInfo = _$_NewCreditCardStoreBaseActionController.startAction(
        name: '_NewCreditCardStoreBase.setShowBackView');
    try {
      return super.setShowBackView(value);
    } finally {
      _$_NewCreditCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCardBrand(CardBrand value) {
    final _$actionInfo = _$_NewCreditCardStoreBaseActionController.startAction(
        name: '_NewCreditCardStoreBase.setCardBrand');
    try {
      return super.setCardBrand(value);
    } finally {
      _$_NewCreditCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic setCvv(String value) {
    final _$actionInfo = _$_NewCreditCardStoreBaseActionController.startAction(
        name: '_NewCreditCardStoreBase.setCvv');
    try {
      return super.setCvv(value);
    } finally {
      _$_NewCreditCardStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showBackView: ${showBackView},
cardBrand: ${cardBrand},
number: ${number},
hasChangedNumber: ${hasChangedNumber},
ownerName: ${ownerName},
hasChangedName: ${hasChangedName},
expirationDate: ${expirationDate},
hasChangedExpireDate: ${hasChangedExpireDate},
cvv: ${cvv},
hasChangedCvv: ${hasChangedCvv},
getNumberError: ${getNumberError},
getNameError: ${getNameError},
getExpireDateError: ${getExpireDateError},
getCvvError: ${getCvvError},
enableButton: ${enableButton}
    ''';
  }
}
