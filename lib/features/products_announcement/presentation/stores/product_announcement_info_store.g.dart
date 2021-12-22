// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_announcement_info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProducAnnouncementInfoStore on _ProducAnnouncementInfoStoreBase, Store {
  Computed<String?>? _$getProductNameErrorComputed;

  @override
  String? get getProductNameError => (_$getProductNameErrorComputed ??=
          Computed<String?>(() => super.getProductNameError,
              name: '_ProducAnnouncementInfoStoreBase.getProductNameError'))
      .value;
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_ProducAnnouncementInfoStoreBase.enableButton'))
          .value;

  final _$productNameAtom =
      Atom(name: '_ProducAnnouncementInfoStoreBase.productName');

  @override
  String get productName {
    _$productNameAtom.reportRead();
    return super.productName;
  }

  @override
  set productName(String value) {
    _$productNameAtom.reportWrite(value, super.productName, () {
      super.productName = value;
    });
  }

  final _$hasChangedProductNameAtom =
      Atom(name: '_ProducAnnouncementInfoStoreBase.hasChangedProductName');

  @override
  bool get hasChangedProductName {
    _$hasChangedProductNameAtom.reportRead();
    return super.hasChangedProductName;
  }

  @override
  set hasChangedProductName(bool value) {
    _$hasChangedProductNameAtom.reportWrite(value, super.hasChangedProductName,
        () {
      super.hasChangedProductName = value;
    });
  }

  final _$_ProducAnnouncementInfoStoreBaseActionController =
      ActionController(name: '_ProducAnnouncementInfoStoreBase');

  @override
  dynamic setProductName(String value) {
    final _$actionInfo = _$_ProducAnnouncementInfoStoreBaseActionController
        .startAction(name: '_ProducAnnouncementInfoStoreBase.setProductName');
    try {
      return super.setProductName(value);
    } finally {
      _$_ProducAnnouncementInfoStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productName: ${productName},
hasChangedProductName: ${hasChangedProductName},
getProductNameError: ${getProductNameError},
enableButton: ${enableButton}
    ''';
  }
}
