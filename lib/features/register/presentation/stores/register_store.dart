import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/core/utils/extensions/string_extensions.dart';
import 'package:my_app/features/register/domain/usecases/register_usecase.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
part 'register_store.g.dart';

class RegisterStepOneStore = _RegisterStepOneStoreBase
    with _$RegisterStepOneStore;

abstract class _RegisterStepOneStoreBase with Store {
  final IRegisterUsecase registerUsecase;

  _RegisterStepOneStoreBase(this.registerUsecase);

  var phoneNumberMask = MaskTextInputFormatter(
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
  String email = '';

  @observable
  bool hasChangedEmail = false;

  @observable
  String phoneNumber = '';

  @observable
  bool hasChangedPhoneNumber = false;

  @action
  setName(String value) {
    hasChangedName = true;
    return name = value;
  }

  @action
  setPhoneNumber(String value) {
    hasChangedPhoneNumber = true;

    return phoneNumber = phoneNumberMask.getUnmaskedText();
  }

  @action
  setEmail(String value) {
    hasChangedEmail = true;
    return email = value;
  }

  @computed
  String? get getNameError {
    if (!hasChangedName) {
      return null;
    } else if (name.isEmpty) {
      return 'Esse campo é obrigatório';
    }

    return null;
  }

  @computed
  String? get getEmailError {
    if (!hasChangedEmail) {
      return null;
    } else if (email.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (!email.isValidEmail) {
      return 'Email inválido';
    }

    return null;
  }

  @computed
  String? get getPhoneNumberError {
    if (!hasChangedPhoneNumber) {
      return null;
    } else if (phoneNumber.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (!phoneNumber.isValidPhoneNumber) {
      return 'Telefone inválido';
    }

    return null;
  }

  @computed
  bool get enableButton {
    return getNameError == null &&
        getEmailError == null &&
        getPhoneNumberError == null &&
        hasChangedName &&
        hasChangedEmail &&
        hasChangedPhoneNumber;
  }

  Future<CheckExistingUserResponseModel> userExists() async {
    CheckExistingUserRequestModel checkExistingUserRequestModel =
        CheckExistingUserRequestModel(
      phoneNumber: phoneNumber,
    );

    return await registerUsecase.userExists(checkExistingUserRequestModel);
  }
}
