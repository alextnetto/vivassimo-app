// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_step_one_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStepOneStore on _RegisterStepOneStoreBase, Store {
  Computed<String?>? _$getNameErrorComputed;

  @override
  String? get getNameError =>
      (_$getNameErrorComputed ??= Computed<String?>(() => super.getNameError,
              name: '_RegisterStepOneStoreBase.getNameError'))
          .value;
  Computed<String?>? _$getEmailErrorComputed;

  @override
  String? get getEmailError =>
      (_$getEmailErrorComputed ??= Computed<String?>(() => super.getEmailError,
              name: '_RegisterStepOneStoreBase.getEmailError'))
          .value;
  Computed<String?>? _$getPhoneNumberErrorComputed;

  @override
  String? get getPhoneNumberError => (_$getPhoneNumberErrorComputed ??=
          Computed<String?>(() => super.getPhoneNumberError,
              name: '_RegisterStepOneStoreBase.getPhoneNumberError'))
      .value;
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_RegisterStepOneStoreBase.enableButton'))
          .value;

  final _$nameAtom = Atom(name: '_RegisterStepOneStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$hasChangedNameAtom =
      Atom(name: '_RegisterStepOneStoreBase.hasChangedName');

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

  final _$emailAtom = Atom(name: '_RegisterStepOneStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$hasChangedEmailAtom =
      Atom(name: '_RegisterStepOneStoreBase.hasChangedEmail');

  @override
  bool get hasChangedEmail {
    _$hasChangedEmailAtom.reportRead();
    return super.hasChangedEmail;
  }

  @override
  set hasChangedEmail(bool value) {
    _$hasChangedEmailAtom.reportWrite(value, super.hasChangedEmail, () {
      super.hasChangedEmail = value;
    });
  }

  final _$phoneNumberAtom = Atom(name: '_RegisterStepOneStoreBase.phoneNumber');

  @override
  String get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$hasChangedPhoneNumberAtom =
      Atom(name: '_RegisterStepOneStoreBase.hasChangedPhoneNumber');

  @override
  bool get hasChangedPhoneNumber {
    _$hasChangedPhoneNumberAtom.reportRead();
    return super.hasChangedPhoneNumber;
  }

  @override
  set hasChangedPhoneNumber(bool value) {
    _$hasChangedPhoneNumberAtom.reportWrite(value, super.hasChangedPhoneNumber,
        () {
      super.hasChangedPhoneNumber = value;
    });
  }

  final _$_RegisterStepOneStoreBaseActionController =
      ActionController(name: '_RegisterStepOneStoreBase');

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_RegisterStepOneStoreBaseActionController
        .startAction(name: '_RegisterStepOneStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RegisterStepOneStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhoneNumber(String value) {
    final _$actionInfo = _$_RegisterStepOneStoreBaseActionController
        .startAction(name: '_RegisterStepOneStoreBase.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_RegisterStepOneStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_RegisterStepOneStoreBaseActionController
        .startAction(name: '_RegisterStepOneStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterStepOneStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
hasChangedName: ${hasChangedName},
email: ${email},
hasChangedEmail: ${hasChangedEmail},
phoneNumber: ${phoneNumber},
hasChangedPhoneNumber: ${hasChangedPhoneNumber},
getNameError: ${getNameError},
getEmailError: ${getEmailError},
getPhoneNumberError: ${getPhoneNumberError},
enableButton: ${enableButton}
    ''';
  }
}
