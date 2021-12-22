// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_description_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductDescriptionStore on _ProductDescriptionStoreBase, Store {
  Computed<String?>? _$getProductDescriptionErrorComputed;

  @override
  String? get getProductDescriptionError =>
      (_$getProductDescriptionErrorComputed ??= Computed<String?>(
              () => super.getProductDescriptionError,
              name: '_ProductDescriptionStoreBase.getProductDescriptionError'))
          .value;
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_ProductDescriptionStoreBase.enableButton'))
          .value;

  final _$productDescriptionAtom =
      Atom(name: '_ProductDescriptionStoreBase.productDescription');

  @override
  String get productDescription {
    _$productDescriptionAtom.reportRead();
    return super.productDescription;
  }

  @override
  set productDescription(String value) {
    _$productDescriptionAtom.reportWrite(value, super.productDescription, () {
      super.productDescription = value;
    });
  }

  final _$hasChangedProductDescriptionAtom =
      Atom(name: '_ProductDescriptionStoreBase.hasChangedProductDescription');

  @override
  bool get hasChangedProductDescription {
    _$hasChangedProductDescriptionAtom.reportRead();
    return super.hasChangedProductDescription;
  }

  @override
  set hasChangedProductDescription(bool value) {
    _$hasChangedProductDescriptionAtom
        .reportWrite(value, super.hasChangedProductDescription, () {
      super.hasChangedProductDescription = value;
    });
  }

  final _$_ProductDescriptionStoreBaseActionController =
      ActionController(name: '_ProductDescriptionStoreBase');

  @override
  dynamic setProductDescription(String value) {
    final _$actionInfo =
        _$_ProductDescriptionStoreBaseActionController.startAction(
            name: '_ProductDescriptionStoreBase.setProductDescription');
    try {
      return super.setProductDescription(value);
    } finally {
      _$_ProductDescriptionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productDescription: ${productDescription},
hasChangedProductDescription: ${hasChangedProductDescription},
getProductDescriptionError: ${getProductDescriptionError},
enableButton: ${enableButton}
    ''';
  }
}
