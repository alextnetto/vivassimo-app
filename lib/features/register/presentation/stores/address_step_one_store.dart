import 'package:mobx/mobx.dart';
import 'package:my_app/core/app_services/location_handler/location_handler.dart';
import 'package:my_app/core/app_services/location_handler/models/cep_response_model.dart';
import 'package:my_app/features/register/domain/usecases/register_usecase.dart';
part 'address_step_one_store.g.dart';

class AddressStepOneStore = _AddressStepOneStoreBase with _$AddressStepOneStore;

abstract class _AddressStepOneStoreBase with Store {
  final IRegisterUsecase registerUsecase;

  _AddressStepOneStoreBase(this.registerUsecase);

  CepResponseModel? cepResponseModel;

  @observable
  String cep = '';

  @observable
  bool hasChangedCep = false;

  @observable
  bool isValidCep = false;

  @action
  setIsValidCep(bool value) {
    return isValidCep = value;
  }

  @action
  setCep(String value) {
    hasChangedCep = true;

    if (value.length == 9) {
      getAddressByCep(value);
    } else {
      setIsValidCep(false);
    }

    return cep = value;
  }

  @computed
  String? get getCepError {
    if (!hasChangedCep) {
      return null;
    } else if (cep.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (cep.length != 9 || !isValidCep) {
      return 'CEP inválido';
    }

    return null;
  }

  @computed
  bool get enableButton => getCepError == null && hasChangedCep;

  Future<void> getAddressByCep(String value) async {
    CepResponseModel cepResponseModel =
        await LocationHandler.getAddressByCep(value);

    if (cepResponseModel.success) {
      setIsValidCep(true);
      this.cepResponseModel = cepResponseModel;
    } else {
      setIsValidCep(false);
      this.cepResponseModel = null;
    }
  }
}
