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
  Computed<String?>? _$getBirthDateErrorComputed;

  @override
  String? get getBirthDateError => (_$getBirthDateErrorComputed ??=
          Computed<String?>(() => super.getBirthDateError,
              name: '_RegisterStepTwoStoreBase.getBirthDateError'))
      .value;

  final _$birthDateAtom = Atom(name: '_RegisterStepTwoStoreBase.birthDate');

  @override
  String get birthDate {
    _$birthDateAtom.reportRead();
    return super.birthDate;
  }

  @override
  set birthDate(String value) {
    _$birthDateAtom.reportWrite(value, super.birthDate, () {
      super.birthDate = value;
    });
  }

  final _$genderAtom = Atom(name: '_RegisterStepTwoStoreBase.gender');

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$hasChangedBirthDateAtom =
      Atom(name: '_RegisterStepTwoStoreBase.hasChangedBirthDate');

  @override
  bool get hasChangedBirthDate {
    _$hasChangedBirthDateAtom.reportRead();
    return super.hasChangedBirthDate;
  }

  @override
  set hasChangedBirthDate(bool value) {
    _$hasChangedBirthDateAtom.reportWrite(value, super.hasChangedBirthDate, () {
      super.hasChangedBirthDate = value;
    });
  }

  final _$_RegisterStepTwoStoreBaseActionController =
      ActionController(name: '_RegisterStepTwoStoreBase');

  @override
  dynamic setBirthDate(String value) {
    final _$actionInfo = _$_RegisterStepTwoStoreBaseActionController
        .startAction(name: '_RegisterStepTwoStoreBase.setBirthDate');
    try {
      return super.setBirthDate(value);
    } finally {
      _$_RegisterStepTwoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGender(String? value) {
    final _$actionInfo = _$_RegisterStepTwoStoreBaseActionController
        .startAction(name: '_RegisterStepTwoStoreBase.setGender');
    try {
      return super.setGender(value);
    } finally {
      _$_RegisterStepTwoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
birthDate: ${birthDate},
gender: ${gender},
hasChangedBirthDate: ${hasChangedBirthDate},
enableButton: ${enableButton},
getBirthDateError: ${getBirthDateError}
    ''';
  }
}
