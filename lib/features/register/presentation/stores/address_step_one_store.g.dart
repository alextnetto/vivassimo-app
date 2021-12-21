// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_step_one_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddressStepOneStore on _AddressStepOneStoreBase, Store {
  Computed<String?>? _$getCepErrorComputed;

  @override
  String? get getCepError =>
      (_$getCepErrorComputed ??= Computed<String?>(() => super.getCepError,
              name: '_AddressStepOneStoreBase.getCepError'))
          .value;

  final _$cepAtom = Atom(name: '_AddressStepOneStoreBase.cep');

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$hasChangedCepAtom =
      Atom(name: '_AddressStepOneStoreBase.hasChangedCep');

  @override
  bool get hasChangedCep {
    _$hasChangedCepAtom.reportRead();
    return super.hasChangedCep;
  }

  @override
  set hasChangedCep(bool value) {
    _$hasChangedCepAtom.reportWrite(value, super.hasChangedCep, () {
      super.hasChangedCep = value;
    });
  }

  final _$_AddressStepOneStoreBaseActionController =
      ActionController(name: '_AddressStepOneStoreBase');

  @override
  dynamic setCep(String value) {
    final _$actionInfo = _$_AddressStepOneStoreBaseActionController.startAction(
        name: '_AddressStepOneStoreBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_AddressStepOneStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cep: ${cep},
hasChangedCep: ${hasChangedCep},
getCepError: ${getCepError}
    ''';
  }
}
