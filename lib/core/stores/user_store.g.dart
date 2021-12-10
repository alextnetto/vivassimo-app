// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStoreBase, Store {
  final _$idAtom = Atom(name: '_UserStoreBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$nameAtom = Atom(name: '_UserStoreBase.name');

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

  final _$phoneNumberAtom = Atom(name: '_UserStoreBase.phoneNumber');

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

  final _$_UserStoreBaseActionController =
      ActionController(name: '_UserStoreBase');

  @override
  dynamic setId(int value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhoneNumber(String value) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserInfo(UserModel userModel) {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.setUserInfo');
    try {
      return super.setUserInfo(userModel);
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeUser() {
    final _$actionInfo = _$_UserStoreBaseActionController.startAction(
        name: '_UserStoreBase.removeUser');
    try {
      return super.removeUser();
    } finally {
      _$_UserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
phoneNumber: ${phoneNumber}
    ''';
  }
}
