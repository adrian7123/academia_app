import 'dart:convert';

class Customer {
  String id;
  String name;
  String cpf;
  String email;
  String pass;
  String phone;
  // String exercises;
  String accessToken;

  Customer({
    required this.id,
    required this.name,
    required this.cpf,
    required this.email,
    required this.pass,
    required this.phone,
    required this.accessToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'cpf': cpf,
      'email': email,
      'pass': pass,
      'phone': phone,
      'accessToken': accessToken,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      cpf: map['cpf'] ?? '',
      email: map['email'] ?? '',
      pass: map['pass'] ?? '',
      phone: map['phone'] ?? '',
      accessToken: map['accessToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(
        json.decode(source),
      );

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, cpf: $cpf, email: $email, pass: $pass, phone: $phone, accessToken: $accessToken)';
  }
}
