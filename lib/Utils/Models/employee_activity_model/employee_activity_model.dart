import 'package:collection/collection.dart';

import 'activity_list.dart';

class EmployeeActivityModel {
  String? activityDate;
  List<ActivityList>? activityList;

  EmployeeActivityModel({this.activityDate, this.activityList});

  factory EmployeeActivityModel.fromJson(Map<dynamic, dynamic> json) {
    return EmployeeActivityModel(
      activityDate: json['activity_date'] as String?,
      activityList: (json['activity_list'] as List<dynamic>?)
          ?.map((e) => ActivityList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'activity_date': activityDate,
        'activity_list': activityList?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! EmployeeActivityModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => activityDate.hashCode ^ activityList.hashCode;
}
