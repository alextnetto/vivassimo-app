// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  Computed<String?>? _$getPhoneNumberErrorComputed;

  @override
  String? get getPhoneNumberError => (_$getPhoneNumberErrorComputed ??=
          Computed<String?>(() => super.getPhoneNumberError,
              name: '_LoginStoreBase.getPhoneNumberError'))
      .value;
  Computed<String?>? _$getPasswordErrorComputed;

  @override
  String? get getPasswordError => (_$getPasswordErrorComputed ??=
          Computed<String?>(() => super.getPasswordError,
              name: '_LoginStoreBase.getPasswordError'))
      .value;
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_LoginStoreBase.enableButton'))
          .value;

  final _$phoneNumberAtom = Atom(name: '_LoginStoreBase.phoneNumber');

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
      Atom(name: '_LoginStoreBase.hasChangedPhoneNumber');

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

  final _$passwordAtom = Atom(name: '_LoginStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$hasChangedPasswordAtom =
      Atom(name: '_LoginStoreBase.hasChangedPassword');

  @override
  bool get hasChangedPassword {
    _$hasChangedPasswordAtom.reportRead();
    return super.hasChangedPassword;
  }

  @override
  set hasChangedPassword(bool value) {
    _$hasChangedPasswordAtom.reportWrite(value, super.hasChangedPassword, () {
      super.hasChangedPassword = value;
    });
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  dynamic setPhoneNumber(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phoneNumber: ${phoneNumber},
hasChangedPhoneNumber: ${hasChangedPhoneNumber},
password: ${password},
hasChangedPassword: ${hasChangedPassword},
getPhoneNumberError: ${getPhoneNumberError},
getPasswordError: ${getPasswordError},
enableButton: ${enableButton}
    ''';
  }
}
