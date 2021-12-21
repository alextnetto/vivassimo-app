import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/core/utils/extensions/string_extensions.dart';
import 'package:my_app/features/register/domain/usecases/register_usecase.dart';
import 'package:my_app/features/register/infra/models/request/check_existing_user_request_model.dart';
import 'package:my_app/features/register/infra/models/response/check_existing_user_response_model.dart';
part 'address_step_one_store.g.dart';

class AddressStepOneStore = _AddressStepOneStoreBase with _$AddressStepOneStore;

abstract class _AddressStepOneStoreBase with Store {
  final IRegisterUsecase registerUsecase;

  _AddressStepOneStoreBase(this.registerUsecase);

  var phoneNumberMask = MaskTextInputFormatter(
    mask: '+55 (##) #####-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  @observable
  String cep = '';

  @observable
  bool hasChangedCep = false;

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
      return 'Esse campo é obrigatório';
    }

    return null;
  }
}
