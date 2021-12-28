// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_step_two_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStepTwoStore on _RegisterStepTwoStoreBase, Store {
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_RegisterStepTwoStoreBase.enableButton'))
          .value;
  Computed<String?>? _$getDataNascimentoErrorComputed;

  @override
  String? get getDataNascimentoError => (_$getDataNascimentoErrorComputed ??=
          Computed<String?>(() => super.getDataNascimentoError,
              name: '_RegisterStepTwoStoreBase.getDataNascimentoError'))
      .value;

  final _$dataNascimentoAtom =
      Atom(name: '_RegisterStepTwoStoreBase.dataNascimento');

  @override
  String get dataNascimento {
    _$dataNascimentoAtom.reportRead();
    return super.dataNascimento;
  }

  @override
  set dataNascimento(String value) {
    _$dataNascimentoAtom.reportWrite(value, super.dataNascimento, () {
      super.dataNascimento = value;
    });
  }

  final _$generoAtom = Atom(name: '_RegisterStepTwoStoreBase.genero');

  @override
  String get genero {
    _$generoAtom.reportRead();
    return super.genero;
  }

  @override
  set genero(String value) {
    _$generoAtom.reportWrite(value, super.genero, () {
      super.genero = value;
    });
  }

  final _$hasChangedDataNascimentoAtom =
      Atom(name: '_RegisterStepTwoStoreBase.hasChangedDataNascimento');

  @override
  bool get hasChangedDataNascimento {
    _$hasChangedDataNascimentoAtom.reportRead();
    return super.hasChangedDataNascimento;
  }

  @override
  set hasChangedDataNascimento(bool value) {
    _$hasChangedDataNascimentoAtom
        .reportWrite(value, super.hasChangedDataNascimento, () {
      super.hasChangedDataNascimento = value;
    });
  }

  final _$_RegisterStepTwoStoreBaseActionController =
      ActionController(name: '_RegisterStepTwoStoreBase');

  @override
  dynamic setDataNascimento(String value) {
    final _$actionInfo = _$_RegisterStepTwoStoreBaseActionController
        .startAction(name: '_RegisterStepTwoStoreBase.setDataNascimento');
    try {
      return super.setDataNascimento(value);
    } finally {
      _$_RegisterStepTwoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGenero(String? value) {
    final _$actionInfo = _$_RegisterStepTwoStoreBaseActionController
        .startAction(name: '_RegisterStepTwoStoreBase.setGenero');
    try {
      return super.setGenero(value);
    } finally {
      _$_RegisterStepTwoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataNascimento: ${dataNascimento},
genero: ${genero},
hasChangedDataNascimento: ${hasChangedDataNascimento},
enableButton: ${enableButton},
getDataNascimentoError: ${getDataNascimentoError}
    ''';
  }
}
