// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_delivery_address_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewDeliveryAddressStore on _NewDeliveryAddressStoreBase, Store {
  Computed<String?>? _$getCepErrorComputed;

  @override
  String? get getCepError =>
      (_$getCepErrorComputed ??= Computed<String?>(() => super.getCepError,
              name: '_NewDeliveryAddressStoreBase.getCepError'))
          .value;
  Computed<String?>? _$getAddressErrorComputed;

  @override
  String? get getAddressError => (_$getAddressErrorComputed ??=
          Computed<String?>(() => super.getAddressError,
              name: '_NewDeliveryAddressStoreBase.getAddressError'))
      .value;
  Computed<String?>? _$getNumberErrorComputed;

  @override
  String? get getNumberError => (_$getNumberErrorComputed ??= Computed<String?>(
          () => super.getNumberError,
          name: '_NewDeliveryAddressStoreBase.getNumberError'))
      .value;
  Computed<String?>? _$getNeighborhoodErrorComputed;

  @override
  String? get getNeighborhoodError => (_$getNeighborhoodErrorComputed ??=
          Computed<String?>(() => super.getNeighborhoodError,
              name: '_NewDeliveryAddressStoreBase.getNeighborhoodError'))
      .value;
  Computed<String?>? _$getUfErrorComputed;

  @override
  String? get getUfError =>
      (_$getUfErrorComputed ??= Computed<String?>(() => super.getUfError,
              name: '_NewDeliveryAddressStoreBase.getUfError'))
          .value;
  Computed<String?>? _$getCityErrorComputed;

  @override
  String? get getCityError =>
      (_$getCityErrorComputed ??= Computed<String?>(() => super.getCityError,
              name: '_NewDeliveryAddressStoreBase.getCityError'))
          .value;
  Computed<bool>? _$enableButtonComputed;

  @override
  bool get enableButton =>
      (_$enableButtonComputed ??= Computed<bool>(() => super.enableButton,
              name: '_NewDeliveryAddressStoreBase.enableButton'))
          .value;

  final _$cepAtom = Atom(name: '_NewDeliveryAddressStoreBase.cep');

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

  final _$addressAtom = Atom(name: '_NewDeliveryAddressStoreBase.address');

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$numberAtom = Atom(name: '_NewDeliveryAddressStoreBase.number');

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  final _$neighborhoodAtom =
      Atom(name: '_NewDeliveryAddressStoreBase.neighborhood');

  @override
  String get neighborhood {
    _$neighborhoodAtom.reportRead();
    return super.neighborhood;
  }

  @override
  set neighborhood(String value) {
    _$neighborhoodAtom.reportWrite(value, super.neighborhood, () {
      super.neighborhood = value;
    });
  }

  final _$ufAtom = Atom(name: '_NewDeliveryAddressStoreBase.uf');

  @override
  String get uf {
    _$ufAtom.reportRead();
    return super.uf;
  }

  @override
  set uf(String value) {
    _$ufAtom.reportWrite(value, super.uf, () {
      super.uf = value;
    });
  }

  final _$cityAtom = Atom(name: '_NewDeliveryAddressStoreBase.city');

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  final _$complementAtom =
      Atom(name: '_NewDeliveryAddressStoreBase.complement');

  @override
  String get complement {
    _$complementAtom.reportRead();
    return super.complement;
  }

  @override
  set complement(String value) {
    _$complementAtom.reportWrite(value, super.complement, () {
      super.complement = value;
    });
  }

  final _$_NewDeliveryAddressStoreBaseActionController =
      ActionController(name: '_NewDeliveryAddressStoreBase');

  @override
  dynamic setCep(String value) {
    final _$actionInfo = _$_NewDeliveryAddressStoreBaseActionController
        .startAction(name: '_NewDeliveryAddressStoreBase.setCep');
    try {
      return super.setCep(value);
    } finally {
      _$_NewDeliveryAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAddress(String value) {
    final _$actionInfo = _$_NewDeliveryAddressStoreBaseActionController
        .startAction(name: '_NewDeliveryAddressStoreBase.setAddress');
    try {
      return super.setAddress(value);
    } finally {
      _$_NewDeliveryAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNumber(String value) {
    final _$actionInfo = _$_NewDeliveryAddressStoreBaseActionController
        .startAction(name: '_NewDeliveryAddressStoreBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$_NewDeliveryAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNeighborhood(String value) {
    final _$actionInfo = _$_NewDeliveryAddressStoreBaseActionController
        .startAction(name: '_NewDeliveryAddressStoreBase.setNeighborhood');
    try {
      return super.setNeighborhood(value);
    } finally {
      _$_NewDeliveryAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUf(String value) {
    final _$actionInfo = _$_NewDeliveryAddressStoreBaseActionController
        .startAction(name: '_NewDeliveryAddressStoreBase.setUf');
    try {
      return super.setUf(value);
    } finally {
      _$_NewDeliveryAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCity(String value) {
    final _$actionInfo = _$_NewDeliveryAddressStoreBaseActionController
        .startAction(name: '_NewDeliveryAddressStoreBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$_NewDeliveryAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setComplement(String value) {
    final _$actionInfo = _$_NewDeliveryAddressStoreBaseActionController
        .startAction(name: '_NewDeliveryAddressStoreBase.setComplement');
    try {
      return super.setComplement(value);
    } finally {
      _$_NewDeliveryAddressStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cep: ${cep},
address: ${address},
number: ${number},
neighborhood: ${neighborhood},
uf: ${uf},
city: ${city},
complement: ${complement},
getCepError: ${getCepError},
getAddressError: ${getAddressError},
getNumberError: ${getNumberError},
getNeighborhoodError: ${getNeighborhoodError},
getUfError: ${getUfError},
getCityError: ${getCityError},
enableButton: ${enableButton}
    ''';
  }
}
