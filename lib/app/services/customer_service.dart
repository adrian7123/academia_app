import 'package:academia_app/app/models/customer.dart';
import 'package:academia_app/app/repository/customer_repository.dart';
import 'package:academia_app/app/shared/api.dart';
import 'package:academia_app/app/shared/api_response.dart';

class CustomerService {
  Future<ApiResponse<Customer?>> login({
    required String email,
    required String pass,
  }) async {
    try {
      final customerRepository = CustomerRepository();

      final customer = await customerRepository.login(email: email, pass: pass);

      return ApiResponse.success('Ok', data: customer);
    } on ApiException catch (e) {
      return ApiResponse.error(e.response?.data['reason']);
    }
  }
}
