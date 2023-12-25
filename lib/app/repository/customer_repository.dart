import 'package:academia_app/app/models/customer.dart';
import 'package:academia_app/app/shared/api.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerRepository {
  Api api = Modular.get();

  Future<Customer> login({
    required String email,
    required String pass,
  }) async {
    late Customer customer;

    final res = await api.post(
      'customer/login',
      data: {
        'email': email,
        'pass': pass,
      },
    );

    customer = Customer.fromMap(res.data);

    return customer;
  }
}
