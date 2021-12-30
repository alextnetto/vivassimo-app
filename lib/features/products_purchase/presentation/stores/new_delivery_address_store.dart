import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/core/app_services/location_handler/location_handler.dart';
import 'package:my_app/core/app_services/location_handler/models/cep_response_model.dart';

import 'new_delivery_address_validation.dart';
part 'new_delivery_address_store.g.dart';

class NewDeliveryAddressStore = _NewDeliveryAddressStoreBase with _$NewDeliveryAddressStore;

abstract class _NewDeliveryAddressStoreBase with Store {
  NewDeliveryAddressValidation validation = NewDeliveryAddressValidation();
  TextEditingController cepController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController ufController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @observable
  String cep = '';

  @observable
  bool isValidCep = false;

  @action
  setIsValidCep(bool value) {
    return isValidCep = value;
  }

  @action
  setCep(String value) {
    validation.hasChangedCep = true;

    return cep = value;
  }

  @computed
  String? get getCepError {
    if (!validation.hasChangedCep) {
      return null;
    } else if (cep.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (cep.length < 9) {
      return 'CEP inválido';
    } else if (!isValidCep) {
      return 'Este CEP é inexistente';
    }

    return null;
  }

  @observable
  String address = '';

  @action
  setAddress(String value) {
    validation.hasChangedAddress = true;
    return address = value;
  }

  @computed
  String? get getAddressError {
    if (!validation.hasChangedAddress) {
      return null;
    } else if (address.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (address.length < 6) {
      return 'Endereço inválido';
    }

    return null;
  }

  @observable
  String number = '';

  @action
  setNumber(String value) {
    validation.hasChangedNumber = true;
    return number = value;
  }

  @computed
  String? get getNumberError {
    if (!validation.hasChangedNumber) {
      return null;
    } else if (number.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  @observable
  String neighborhood = '';

  @action
  setNeighborhood(String value) {
    validation.hasChangedNeighborhood = true;
    return neighborhood = value;
  }

  @computed
  String? get getNeighborhoodError {
    if (!validation.hasChangedNeighborhood) {
      return null;
    } else if (neighborhood.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (neighborhood.length < 5) {
      return 'Bairro inválido';
    }

    return null;
  }

  @observable
  String uf = 'SP';

  @action
  setUf(String value) {
    return uf = value;
  }

  @observable
  String city = '';

  @action
  setCity(String value) {
    validation.hasChangedCity = true;
    return city = value;
  }

  @computed
  String? get getCityError {
    if (!validation.hasChangedCity) {
      return null;
    } else if (city.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (city.length < 2) {
      return 'Cidade inválida';
    }

    return null;
  }

  @observable
  String complement = '';

  @action
  setComplement(String value) {
    validation.hasChangedComplement = true;
    return complement = value;
  }

  @computed
  bool get enableButton =>
      validation.hasChangedAllFields &&
      getCityError == null &&
      getAddressError == null &&
      getCepError == null &&
      getNeighborhoodError == null &&
      // getUfError == null &&
      getNumberError == null;

  Future<void> getAddressByCep(String value, BuildContext context) async {
    CepResponseModel cepResponseModel = await LocationHandler.getAddressByCep(value);

    if (cepResponseModel.success) {
      setIsValidCep(true);
      await setAddressByCep(cepResponseModel);
    } else {
      setIsValidCep(false);
    }
  }

  Future<void> setAddressByCep(CepResponseModel cepResponseModel) async {
    setAddress(cepResponseModel.street);
    addressController.text = cepResponseModel.street;

    setNeighborhood(cepResponseModel.neighborhood);
    neighborhoodController.text = cepResponseModel.neighborhood;

    setUf(cepResponseModel.state);

    setCity(cepResponseModel.city);
    cityController.text = cepResponseModel.city;
  }
}
