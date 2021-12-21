import 'package:mobx/mobx.dart';
part 'new_delivery_address_validation.g.dart';

class NewDeliveryAddressValidation = _NewDeliveryAddressValidationBase with _$NewDeliveryAddressValidation;

abstract class _NewDeliveryAddressValidationBase with Store {
  @observable
  bool hasChangedCep = false;

  @observable
  bool hasChangedAddress = false;

  @observable
  bool hasChangedNumber = false;

  @observable
  bool hasChangedNeighborhood = false;

  @observable
  bool hasChangedUf = false;

  @observable
  bool hasChangedCity = false;

  @observable
  bool hasChangedComplement = false;

  @computed
  bool get hasChangedAllFields =>
      hasChangedCep &&
      hasChangedAddress &&
      hasChangedNumber &&
      hasChangedNeighborhood &&
      // hasChangedUf &&
      hasChangedCity;
}
