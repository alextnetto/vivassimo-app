import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/core/utils/constants/constants.dart';
import 'package:my_app/features/register/domain/usecases/register_usecase.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
part 'register_store.g.dart';

class RegisterStepOneStore = _RegisterStepOneStoreBase
    with _$RegisterStepOneStore;

abstract class _RegisterStepOneStoreBase with Store {
  final IRegisterUsecase registerUsecase;

  _RegisterStepOneStoreBase(this.registerUsecase);

  var phoneNumberFormatter = MaskTextInputFormatter(
    mask: '+55 (##) #####-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  @observable
  String name = '';

  @observable
  bool hasChangedName = false;

  @observable
  String phoneNumber = '';

  @observable
  bool hasChangedNamePhoneNumber = false;

  @observable
  String email = '';

  @observable
  bool hasChangedNameEmail = false;

  @action
  setName(String value) {
    hasChangedName = true;
    return name = value;
  }

  @action
  setPhoneNumber(String value) {
    hasChangedNamePhoneNumber = true;
    return phoneNumber = value;
  }

  @action
  setEmail(String value) {
    hasChangedNameEmail = true;
    return email = value;
  }

  @computed
  String? get getPhoneNumberError {
    if (!hasChangedNamePhoneNumber) {
      return null;
    } else if (phoneNumber.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (phoneNumber.length < Constants.phoneNumberValidLength) {
      return 'Telefone inválido';
    }

    return null;
  }

  Future<CheckExistingUserResponseModel> userExists() async {
    CheckExistingUserRequestModel checkExistingUserRequestModel =
        CheckExistingUserRequestModel(
      phoneNumber: phoneNumber,
    );

    return await registerUsecase.userExists(checkExistingUserRequestModel);
  }
}
