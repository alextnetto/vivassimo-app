import 'package:mobx/mobx.dart';
part 'product_description_store.g.dart';

class ProductDescriptionStore = _ProductDescriptionStoreBase with _$ProductDescriptionStore;

abstract class _ProductDescriptionStoreBase with Store {
  @observable
  String productDescription = '';

  @observable
  bool hasChangedProductDescription = false;

  @action
  setProductDescription(String value) {
    hasChangedProductDescription = true;
    return productDescription = value;
  }

  @computed
  String? get getProductDescriptionError {
    if (!hasChangedProductDescription) {
      return null;
    } else if (productDescription.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (productDescription.length < 6) {
      return 'Descrição muito curta';
    }

    return null;
  }

  @computed
  bool get enableButton => getProductDescriptionError == null && hasChangedProductDescription;
}
