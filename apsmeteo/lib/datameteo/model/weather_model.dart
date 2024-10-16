import 'package:apsmeteo/datameteo/model/condition_model.dart';
import 'package:apsmeteo/datameteo/model/current_model.dart';
import 'package:apsmeteo/datameteo/model/forecast_model.dart';
import 'package:apsmeteo/datameteo/model/location_model.dart';

class WeatherModel{
  ForecastModel forecast;
  CurrentModel current;
  LocationModel location;

  WeatherModel.fromJson(Map<String, dynamic>json):
  current = CurrentModel.fromJson(json['current']),
  location = LocationModel.fromJson(json['location']),
  forecast = ForecastModel(json['forecast']);

}