// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_photo_confirmation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductPhotoConfirmationStore
    on _ProductPhotoCOnfirmationStoreBase, Store {
  Computed<int>? _$getImagesPathListLengthComputed;

  @override
  int get getImagesPathListLength => (_$getImagesPathListLengthComputed ??=
          Computed<int>(() => super.getImagesPathListLength,
              name:
                  '_ProductPhotoCOnfirmationStoreBase.getImagesPathListLength'))
      .value;

  final _$_ProductPhotoCOnfirmationStoreBaseActionController =
      ActionController(name: '_ProductPhotoCOnfirmationStoreBase');

  @override
  dynamic addImagesPathList(String imagePath) {
    final _$actionInfo =
        _$_ProductPhotoCOnfirmationStoreBaseActionController.startAction(
            name: '_ProductPhotoCOnfirmationStoreBase.addImagesPathList');
    try {
      return super.addImagesPathList(imagePath);
    } finally {
      _$_ProductPhotoCOnfirmationStoreBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getImagesPathListLength: ${getImagesPathListLength}
    ''';
  }
}
