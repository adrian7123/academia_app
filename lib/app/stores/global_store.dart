import 'package:academia_app/app/models/customer.dart';
import 'package:mobx/mobx.dart';
part 'global_store.g.dart';

class GlobalStore = _GlobalStoreBase with _$GlobalStore;

abstract class _GlobalStoreBase with Store {
  @observable
  Customer? customer;
}
