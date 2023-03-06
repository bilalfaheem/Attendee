import 'package:collection/collection.dart';

class AllEmployeeQ {
  String? id;
  String? companyId;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? createdAt;
  String? employeeId;

  AllEmployeeQ({
    this.id,
    this.companyId,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.createdAt,
    this.employeeId,
  });

  factory AllEmployeeQ.fromJson(Map<dynamic, dynamic> json) => AllEmployeeQ(
        id: json['id'] as String?,
        companyId: json['company_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        password: json['password'] as String?,
        createdAt: json['created_at'] as String?,
        employeeId: json['employee_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'company_id': companyId,
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'created_at': createdAt,
        'employee_id': employeeId,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AllEmployeeQ) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      companyId.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      password.hashCode ^
      createdAt.hashCode ^
      employeeId.hashCode;
}
