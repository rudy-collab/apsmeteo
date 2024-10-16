// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:apsmeteo/datameteo/model/weather_model.dart';

class WeatherController extends StateNotifier<AsyncValue<WeatherModel?>> {
  Ref ref;
  WeatherController({
    required this.ref,
  }) : super(const AsyncValue.loading());


  Future<void> getDataWeather({required String town})async{

    state = const AsyncValue.loading();
    try{

      final response = await http.get(
        Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=8680650822d14530af1113023241707&q=$town&lang=fr&days=3')
      );

      final jsonData = jsonDecode(response.body);
      state = AsyncValue.data(WeatherModel.fromJson(jsonData));

    }catch(error, stackTrace){
      state = AsyncValue.error(error, stackTrace);

    }

  }

 



}
