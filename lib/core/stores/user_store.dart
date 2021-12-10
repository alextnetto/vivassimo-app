import 'package:mobx/mobx.dart';
import 'package:my_app/core/models/user_model.dart';
import 'package:my_app/core/shared_modules/cache/domain/usecases/cache_usecase.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final ICacheUsecase cacheUsecase;

  _UserStoreBase(this.cacheUsecase);

  @observable
  int id = 0;

  @action
  setId(int value) => id = value;

  @observable
  String name = '';

  @action
  setName(String value) => name = value;

  @observable
  String phoneNumber = '';

  @action
  setPhoneNumber(String value) => phoneNumber = value;

  @action
  setUserInfo(UserModel userModel) {
    id = userModel.id ?? 0;
    name = userModel.name ?? '';
    phoneNumber = userModel.phoneNumber ?? '';
  }

  @action
  removeUser() {
    id = 0;
    name = '';
    phoneNumber = '';
  }

  getUserInfo() async {
    var userInfo = await cacheUsecase.getCache('UserInfo');
    dynamic response = userInfo.getOrElse(() => null);

    if (response != null) {
      setUserInfo(UserModel.fromJson(response));
    }
  }
}
