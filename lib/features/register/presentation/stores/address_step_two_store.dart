import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/core/app_services/location_handler/location_handler.dart';
import 'package:my_app/core/app_services/location_handler/models/cep_response_model.dart';
import 'package:my_app/features/register/domain/usecases/register_usecase.dart';
import 'package:my_app/features/register/infra/models/request/register_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/register_user_response_model.dart';
part 'address_step_two_store.g.dart';

class AddressStepTwoStore = _AddressStepTwoStoreBase with _$AddressStepTwoStore;

abstract class _AddressStepTwoStoreBase with Store {
  final IRegisterUsecase registerUsecase;

  _AddressStepTwoStoreBase(this.registerUsecase);

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

  @observable
  bool hasChangedCep = false;

  @action
  setIsValidCep(bool value) {
    return isValidCep = value;
  }

  @action
  setCep(String value) {
    hasChangedCep = true;

    return cep = value;
  }

  @computed
  String? get getCepError {
    if (!hasChangedCep) {
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

  @observable
  bool hasChangedAddress = false;

  @action
  setAddress(String value) {
    hasChangedAddress = true;
    return address = value;
  }

  @computed
  String? get getAddressError {
    if (!hasChangedAddress) {
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

  @observable
  bool hasChangedNumber = false;

  @action
  setNumber(String value) {
    hasChangedNumber = true;
    return number = value;
  }

  @computed
  String? get getNumberError {
    if (!hasChangedNumber) {
      return null;
    } else if (number.isEmpty) {
      return 'Este campo é obrigatório';
    }

    return null;
  }

  @observable
  String neighborhood = '';

  @observable
  bool hasChangedNeighborhood = false;

  @action
  setNeighborhood(String value) {
    hasChangedNeighborhood = true;
    return neighborhood = value;
  }

  @computed
  String? get getNeighborhoodError {
    if (!hasChangedNeighborhood) {
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

  @observable
  bool hasChangedCity = false;

  @action
  setCity(String value) {
    hasChangedCity = true;
    return city = value;
  }

  @computed
  String? get getCityError {
    if (!hasChangedCity) {
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

  @observable
  bool hasChangedComplement = false;

  @action
  setComplement(String value) {
    hasChangedComplement = true;
    return complement = value;
  }

  @computed
  bool get hasChangedAllFields =>
      hasChangedCep &&
      hasChangedAddress &&
      hasChangedNumber &&
      hasChangedNeighborhood &&
      // hasChangedUf &&
      hasChangedCity;

  @computed
  bool get enableButton =>
      hasChangedAllFields &&
      getCityError == null &&
      getAddressError == null &&
      getCepError == null &&
      getNeighborhoodError == null &&
      getNumberError == null;

  Future<void> getAddressByCep(String value, BuildContext context) async {
    CepResponseModel address = await LocationHandler.getAddressByCep(value);

    if (address.success) {
      setIsValidCep(true);
      await setAddressByCep(address);
    } else {
      setIsValidCep(false);
    }
  }

  Future<void> setAddressByCep(CepResponseModel addressData) async {
    setCep(addressData.cep);
    setIsValidCep(true);
    cepController.text = addressData.cep;

    setAddress(addressData.logradouro);
    addressController.text = addressData.logradouro;

    setNeighborhood(addressData.bairro);
    neighborhoodController.text = addressData.bairro;

    setUf(addressData.uf);
    // ufController.text = addressFromCep['uf'];

    setCity(addressData.localidade);
    cityController.text = addressData.localidade;
  }

  Future<RegisterUserResponseModel> register(
      RegisterUserRequestModel registerUserRequestModel) async {
    return await registerUsecase.register(registerUserRequestModel);
  }
}
