
import 'package:apsmeteo/datameteo/controller/weather_controller.dart';
import 'package:apsmeteo/datameteo/model/weather_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weathers = StateNotifierProvider<WeatherController, AsyncValue<WeatherModel?>>((ref)=>WeatherController(ref: ref));