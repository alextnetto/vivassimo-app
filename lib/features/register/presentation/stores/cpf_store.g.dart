// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cpf_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CpfStore on _CpfStoreBase, Store {
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_CpfStoreBase.enableButton'))
          .value;
  Computed<String?>? _$getCpfErrorComputed;

  @override
  String? get getCpfError =>
      (_$getCpfErrorComputed ??= Computed<String?>(() => super.getCpfError,
              name: '_CpfStoreBase.getCpfError'))
          .value;

  final _$cpfAtom = Atom(name: '_CpfStoreBase.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$hasChangedCpfAtom = Atom(name: '_CpfStoreBase.hasChangedCpf');

  @override
  bool get hasChangedCpf {
    _$hasChangedCpfAtom.reportRead();
    return super.hasChangedCpf;
  }

  @override
  set hasChangedCpf(bool value) {
    _$hasChangedCpfAtom.reportWrite(value, super.hasChangedCpf, () {
      super.hasChangedCpf = value;
    });
  }

  final _$_CpfStoreBaseActionController =
      ActionController(name: '_CpfStoreBase');

  @override
  dynamic setCpf(String value) {
    final _$actionInfo = _$_CpfStoreBaseActionController.startAction(
        name: '_CpfStoreBase.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_CpfStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cpf: ${cpf},
hasChangedCpf: ${hasChangedCpf},
enableButton: ${enableButton},
getCpfError: ${getCpfError}
    ''';
  }
}
