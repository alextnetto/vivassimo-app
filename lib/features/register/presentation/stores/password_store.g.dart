// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PasswordStore on _PasswordStoreBase, Store {
  Computed<String?>? _$getPasswordErrorComputed;

  @override
  String? get getPasswordError => (_$getPasswordErrorComputed ??=
          Computed<String?>(() => super.getPasswordError,
              name: '_PasswordStoreBase.getPasswordError'))
      .value;
  Computed<String?>? _$getPasswordConfirmationErrorComputed;

  @override
  String? get getPasswordConfirmationError =>
      (_$getPasswordConfirmationErrorComputed ??= Computed<String?>(
              () => super.getPasswordConfirmationError,
              name: '_PasswordStoreBase.getPasswordConfirmationError'))
          .value;

  final _$isPasswordVisibleAtom =
      Atom(name: '_PasswordStoreBase.isPasswordVisible');

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  final _$passwordAtom = Atom(name: '_PasswordStoreBase.password');

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
      Atom(name: '_PasswordStoreBase.hasChangedPassword');

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

  final _$passwordConfirmationAtom =
      Atom(name: '_PasswordStoreBase.passwordConfirmation');

  @override
  String get passwordConfirmation {
    _$passwordConfirmationAtom.reportRead();
    return super.passwordConfirmation;
  }

  @override
  set passwordConfirmation(String value) {
    _$passwordConfirmationAtom.reportWrite(value, super.passwordConfirmation,
        () {
      super.passwordConfirmation = value;
    });
  }

  final _$hasChangedPasswordConfirmationAtom =
      Atom(name: '_PasswordStoreBase.hasChangedPasswordConfirmation');

  @override
  bool get hasChangedPasswordConfirmation {
    _$hasChangedPasswordConfirmationAtom.reportRead();
    return super.hasChangedPasswordConfirmation;
  }

  @override
  set hasChangedPasswordConfirmation(bool value) {
    _$hasChangedPasswordConfirmationAtom
        .reportWrite(value, super.hasChangedPasswordConfirmation, () {
      super.hasChangedPasswordConfirmation = value;
    });
  }

  final _$_PasswordStoreBaseActionController =
      ActionController(name: '_PasswordStoreBase');

  @override
  dynamic changePasswordVisibity() {
    final _$actionInfo = _$_PasswordStoreBaseActionController.startAction(
        name: '_PasswordStoreBase.changePasswordVisibity');
    try {
      return super.changePasswordVisibity();
    } finally {
      _$_PasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_PasswordStoreBaseActionController.startAction(
        name: '_PasswordStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_PasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPasswordConfirmation(String value) {
    final _$actionInfo = _$_PasswordStoreBaseActionController.startAction(
        name: '_PasswordStoreBase.setPasswordConfirmation');
    try {
      return super.setPasswordConfirmation(value);
    } finally {
      _$_PasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPasswordVisible: ${isPasswordVisible},
password: ${password},
hasChangedPassword: ${hasChangedPassword},
passwordConfirmation: ${passwordConfirmation},
hasChangedPasswordConfirmation: ${hasChangedPasswordConfirmation},
getPasswordError: ${getPasswordError},
getPasswordConfirmationError: ${getPasswordConfirmationError}
    ''';
  }
}
