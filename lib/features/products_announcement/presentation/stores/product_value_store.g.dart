// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_value_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductValueStore on _ProductValueStoreBase, Store {
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_ProductValueStoreBase.enableButton'))
          .value;
  Computed<String?>? _$getProductValueErrorComputed;

  @override
  String? get getProductValueError => (_$getProductValueErrorComputed ??=
          Computed<String?>(() => super.getProductValueError,
              name: '_ProductValueStoreBase.getProductValueError'))
      .value;

  final _$productValueAtom = Atom(name: '_ProductValueStoreBase.productValue');

  @override
  num get productValue {
    _$productValueAtom.reportRead();
    return super.productValue;
  }

  @override
  set productValue(num value) {
    _$productValueAtom.reportWrite(value, super.productValue, () {
      super.productValue = value;
    });
  }

  final _$productValueStringAtom =
      Atom(name: '_ProductValueStoreBase.productValueString');

  @override
  String get productValueString {
    _$productValueStringAtom.reportRead();
    return super.productValueString;
  }

  @override
  set productValueString(String value) {
    _$productValueStringAtom.reportWrite(value, super.productValueString, () {
      super.productValueString = value;
    });
  }

  final _$hasChangedProductValueStringAtom =
      Atom(name: '_ProductValueStoreBase.hasChangedProductValueString');

  @override
  bool get hasChangedProductValueString {
    _$hasChangedProductValueStringAtom.reportRead();
    return super.hasChangedProductValueString;
  }

  @override
  set hasChangedProductValueString(bool value) {
    _$hasChangedProductValueStringAtom
        .reportWrite(value, super.hasChangedProductValueString, () {
      super.hasChangedProductValueString = value;
    });
  }

  final _$_ProductValueStoreBaseActionController =
      ActionController(name: '_ProductValueStoreBase');

  @override
  dynamic setProductValue(num value) {
    final _$actionInfo = _$_ProductValueStoreBaseActionController.startAction(
        name: '_ProductValueStoreBase.setProductValue');
    try {
      return super.setProductValue(value);
    } finally {
      _$_ProductValueStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProductValueString(String value) {
    final _$actionInfo = _$_ProductValueStoreBaseActionController.startAction(
        name: '_ProductValueStoreBase.setProductValueString');
    try {
      return super.setProductValueString(value);
    } finally {
      _$_ProductValueStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productValue: ${productValue},
productValueString: ${productValueString},
hasChangedProductValueString: ${hasChangedProductValueString},
enableButton: ${enableButton},
getProductValueError: ${getProductValueError}
    ''';
  }
}
