import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/core/utils/extensions/string_extensions.dart';
import 'package:my_app/features/register/domain/usecases/register_usecase.dart';
part 'cpf_store.g.dart';

class CpfStore = _CpfStoreBase with _$CpfStore;

abstract class _CpfStoreBase with Store {
  final IRegisterUsecase registerUsecase;

  _CpfStoreBase(this.registerUsecase);

  var cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  @observable
  String cpf = '';

  @observable
  bool hasChangedCpf = false;

  @action
  setCpf(String value) {
    hasChangedCpf = true;
    return cpf = value;
  }

  @computed
  bool get enableButton {
    return getCpfError == null && hasChangedCpf;
  }

  @computed
  String? get getCpfError {
    if (!hasChangedCpf) {
      return null;
    } else if (cpf.isEmpty) {
      return 'Esse campo é obrigatório';
    } else if (!cpf.isValidCpf) {
      return 'CPF inválido';
    }

    return null;
  }
}
