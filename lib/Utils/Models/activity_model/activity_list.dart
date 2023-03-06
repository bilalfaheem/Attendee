import 'package:collection/collection.dart';

class ActivityList {
  String? id;
  String? status;
  String? isLate;
  String? userId;
  String? date;
  String? time;
  String? createdAt;
  String? companyId;
  String? name;
  String? email;
  String? phone;
  String? password;

  ActivityList({
    this.id,
    this.status,
    this.isLate,
    this.userId,
    this.date,
    this.time,
    this.createdAt,
    this.companyId,
    this.name,
    this.email,
    this.phone,
    this.password,
  });

  factory ActivityList.fromJson(Map<dynamic, dynamic> json) => ActivityList(
        id: json['id'] as String?,
        status: json['status'] as String?,
        isLate: json['is_late'] as String?,
        userId: json['user_id'] as String?,
        date: json['date'] as String?,
        time: json['time'] as String?,
        createdAt: json['created_at'] as String?,
        companyId: json['company_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'is_late': isLate,
        'user_id': userId,
        'date': date,
        'time': time,
        'created_at': createdAt,
        'company_id': companyId,
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ActivityList) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      status.hashCode ^
      isLate.hashCode ^
      userId.hashCode ^
      date.hashCode ^
      time.hashCode ^
      createdAt.hashCode ^
      companyId.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      password.hashCode;
}
