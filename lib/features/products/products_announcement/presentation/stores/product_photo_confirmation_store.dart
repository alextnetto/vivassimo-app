import 'package:mobx/mobx.dart';
part 'product_photo_confirmation_store.g.dart';

class ProductPhotoConfirmationStore = _ProductPhotoCOnfirmationStoreBase with _$ProductPhotoConfirmationStore;

abstract class _ProductPhotoCOnfirmationStoreBase with Store {
  ObservableList<String> imagesPathList = ObservableList<String>();

  @action
  addImagesPathList(String imagePath) {
    // var list = deliveryAddresses;
    // list.add(addressEntity);
    // deliveryAddresses.clear();
    imagesPathList.add(imagePath);
  }

  @computed
  int get getImagesPathListLength => imagesPathList.length == 6 ? imagesPathList.length : imagesPathList.length + 1;
}
