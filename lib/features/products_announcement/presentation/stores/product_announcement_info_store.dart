import 'package:mobx/mobx.dart';
part 'product_announcement_info_store.g.dart';

class ProducAnnouncementInfoStore = _ProducAnnouncementInfoStoreBase with _$ProducAnnouncementInfoStore;

abstract class _ProducAnnouncementInfoStoreBase with Store {
  @observable
  String productName = '';

  @observable
  bool hasChangedProductName = false;

  @action
  setProductName(String value) {
    hasChangedProductName = true;
    return productName = value;
  }

  @computed
  String? get getProductNameError {
    if (!hasChangedProductName) {
      return null;
    } else if (productName.isEmpty) {
      return 'Este campo é obrigatório';
    } else if (productName.length < 6) {
      return 'Descrição muito curta';
    }

    return null;
  }

  @computed
  bool get enableButton => getProductNameError == null && hasChangedProductName;
}
