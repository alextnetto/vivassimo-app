import 'package:mobx/mobx.dart';
import 'package:my_app/core/utils/extensions/string_extensions.dart';
import 'package:my_app/features/register/domain/usecases/register_usecase.dart';
part 'register_step_two_store.g.dart';

class RegisterStepTwoStore = _RegisterStepTwoStoreBase
    with _$RegisterStepTwoStore;

abstract class _RegisterStepTwoStoreBase with Store {
  final IRegisterUsecase registerUsecase;

  _RegisterStepTwoStoreBase(this.registerUsecase);

  @observable
  String birthDate = '';

  @observable
  String gender = '';

  @observable
  bool hasChangedBirthDate = false;

  @action
  setBirthDate(String value) {
    hasChangedBirthDate = true;
    return birthDate = value;
  }

  @action
  setGender(String? value) {
    return gender = value!;
  }

  @computed
  bool get enableButton {
    return getBirthDateError == null &&
        hasChangedBirthDate &&
        gender.isNotEmpty;
  }

  @computed
  String? get getBirthDateError {
    if (!hasChangedBirthDate) {
      return null;
    } else if (birthDate.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (!birthDate.isValidBirthDate) {
      return 'Data inválida';
    }

    return null;
  }
}
