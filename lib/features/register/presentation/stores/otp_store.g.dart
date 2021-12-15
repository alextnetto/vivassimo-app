// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OtpStore on _OtpStoreBase, Store {
  final _$phoneNumberAtom = Atom(name: '_OtpStoreBase.phoneNumber');

  @override
  String? get phoneNumber {
    _$phoneNumberAtom.reportRead();
    return super.phoneNumber;
  }

  @override
  set phoneNumber(String? value) {
    _$phoneNumberAtom.reportWrite(value, super.phoneNumber, () {
      super.phoneNumber = value;
    });
  }

  final _$_OtpStoreBaseActionController =
      ActionController(name: '_OtpStoreBase');

  @override
  dynamic setPhoneNumber(String value) {
    final _$actionInfo = _$_OtpStoreBaseActionController.startAction(
        name: '_OtpStoreBase.setPhoneNumber');
    try {
      return super.setPhoneNumber(value);
    } finally {
      _$_OtpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
phoneNumber: ${phoneNumber}
    ''';
  }
}
