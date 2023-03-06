import 'package:collection/collection.dart';

class ActivityList {
  String? id;
  String? status;
  String? isLate;
  String? userId;
  String? date;
  String? time;
  String? createdAt;

  ActivityList({
    this.id,
    this.status,
    this.isLate,
    this.userId,
    this.date,
    this.time,
    this.createdAt,
  });

  factory ActivityList.fromJson(Map<dynamic, dynamic> json) => ActivityList(
        id: json['id'] as String?,
        status: json['status'] as String?,
        isLate: json['is_late'] as String?,
        userId: json['user_id'] as String?,
        date: json['date'] as String?,
        time: json['time'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'is_late': isLate,
        'user_id': userId,
        'date': date,
        'time': time,
        'created_at': createdAt,
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
      createdAt.hashCode;
}
