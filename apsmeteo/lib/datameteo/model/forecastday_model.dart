// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:apsmeteo/datameteo/model/day_model.dart';

class ForecastDayModel {
  DayModel? day;
  String date;
  ForecastDayModel({
    required this.day,
    required this.date,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic>json){
    return ForecastDayModel(
      day: DayModel.fromJson(json['day']), 
      date: json['date'] ?? '');
  }

}
