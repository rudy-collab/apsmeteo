import 'package:apsmeteo/datameteo/model/forecastday_model.dart';

class ForecastModel{
  List<ForecastDayModel> forecastday = [];

  ForecastModel(Map<String, dynamic>json){
    final list = json['forecastday'] as List<dynamic>;
    forecastday = list.map((d)=>ForecastDayModel.fromJson(d as Map<String,dynamic>)).toList();
  }

}