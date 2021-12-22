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
  String dataNascimento = '';

  @observable
  String genero = '';

  @observable
  bool hasChangedDataNascimento = false;

  @action
  setDataNascimento(String value) {
    hasChangedDataNascimento = true;
    return dataNascimento = value;
  }

  @action
  setGenero(String? value) {
    return genero = value!;
  }

  @computed
  bool get enableButton {
    return getDataNascimentoError == null &&
        hasChangedDataNascimento &&
        genero.isNotEmpty;
  }

  @computed
  String? get getDataNascimentoError {
    if (!hasChangedDataNascimento) {
      return null;
    } else if (dataNascimento.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (!dataNascimento.isValidBirthday) {
      return 'Data inválida';
    }

    return null;
  }
}
