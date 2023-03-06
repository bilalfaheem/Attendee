import 'package:collection/collection.dart';

import 'activity_list.dart';

class ActivityModel {
  String? activityDate;
  List<ActivityList>? activityList;

  ActivityModel({this.activityDate, this.activityList});

  factory ActivityModel.fromJson(Map<dynamic, dynamic> json) => ActivityModel(
        activityDate: json['activity_date'] as String?,
        activityList: (json['activity_list'] as List<dynamic>?)
            ?.map((e) => ActivityList.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'activity_date': activityDate,
        'activity_list': activityList?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ActivityModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => activityDate.hashCode ^ activityList.hashCode;
}
