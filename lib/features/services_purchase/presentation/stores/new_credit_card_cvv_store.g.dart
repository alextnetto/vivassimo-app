// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_credit_card_cvv_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewCreditCardCvvStore on _NewCreditCardCvvStoreBase, Store {
  Computed<String?>? _$getNumberErrorComputed;

  @override
  String? get getNumberError => (_$getNumberErrorComputed ??= Computed<String?>(
          () => super.getNumberError,
          name: '_NewCreditCardCvvStoreBase.getNumberError'))
      .value;
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_NewCreditCardCvvStoreBase.enableButton'))
          .value;

  final _$numberAtom = Atom(name: '_NewCreditCardCvvStoreBase.number');

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
      Atom(name: '_NewCreditCardCvvStoreBase.hasChangedNumber');

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

  final _$_NewCreditCardCvvStoreBaseActionController =
      ActionController(name: '_NewCreditCardCvvStoreBase');

  @override
  dynamic setNumber(String value) {
    final _$actionInfo = _$_NewCreditCardCvvStoreBaseActionController
        .startAction(name: '_NewCreditCardCvvStoreBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$_NewCreditCardCvvStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
number: ${number},
hasChangedNumber: ${hasChangedNumber},
getNumberError: ${getNumberError},
enableButton: ${enableButton}
    ''';
  }
}
