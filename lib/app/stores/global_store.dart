import 'package:academia_app/app/models/customer.dart';
import 'package:academia_app/app/shared/api.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'global_store.g.dart';

class GlobalStore = _GlobalStoreBase with _$GlobalStore;

abstract class _GlobalStoreBase with Store {
  Api api = Modular.get();

  @observable
  Customer? customer;

  @action
  Future<void> setCustomer(Customer? customer) async {
    this.customer = customer;

    api.setHeader(
      'Authorization',
      'Bearer ${customer?.accessToken}',
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (customer != null) {
      prefs.setString('customer', customer.toJson());
    } else {
      prefs.remove('customer');
    }
  }

  @action
  Future<Customer?> getCustomer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final customerJson = prefs.getString('customer');

    if (customerJson != null) {
      return Customer.fromJson(prefs.getString('customer')!);
    }

    return null;
  }

  @action
  Future<bool> checkLoggedIn() async {
    Customer? customer = await getCustomer();

    if (customer?.accessToken == null) {
      return false;
    }

    api.setHeader(
      'Authorization',
      'Bearer ${customer?.accessToken}',
    );

    await setCustomer(customer);

    return true;
  }
}
