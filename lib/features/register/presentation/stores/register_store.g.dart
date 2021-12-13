// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStepOneStore on _RegisterStepOneStoreBase, Store {
  Computed<String?>? _$getPhoneNumberErrorComputed;

  @override
  String? get getPhoneNumberError => (_$getPhoneNumberErrorComputed ??=
          Computed<String?>(() => super.getPhoneNumberError,
              name: '_RegisterStepOneStoreBase.getPhoneNumberError'))
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

  final _$hasChangedNamePhoneNumberAtom =
      Atom(name: '_RegisterStepOneStoreBase.hasChangedNamePhoneNumber');

  @override
  bool get hasChangedNamePhoneNumber {
    _$hasChangedNamePhoneNumberAtom.reportRead();
    return super.hasChangedNamePhoneNumber;
  }

  @override
  set hasChangedNamePhoneNumber(bool value) {
    _$hasChangedNamePhoneNumberAtom
        .reportWrite(value, super.hasChangedNamePhoneNumber, () {
      super.hasChangedNamePhoneNumber = value;
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

  final _$hasChangedNameEmailAtom =
      Atom(name: '_RegisterStepOneStoreBase.hasChangedNameEmail');

  @override
  bool get hasChangedNameEmail {
    _$hasChangedNameEmailAtom.reportRead();
    return super.hasChangedNameEmail;
  }

  @override
  set hasChangedNameEmail(bool value) {
    _$hasChangedNameEmailAtom.reportWrite(value, super.hasChangedNameEmail, () {
      super.hasChangedNameEmail = value;
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
phoneNumber: ${phoneNumber},
hasChangedNamePhoneNumber: ${hasChangedNamePhoneNumber},
email: ${email},
hasChangedNameEmail: ${hasChangedNameEmail},
getPhoneNumberError: ${getPhoneNumberError}
    ''';
  }
}
