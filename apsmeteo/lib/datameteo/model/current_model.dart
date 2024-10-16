// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:apsmeteo/datameteo/model/condition_model.dart';

class CurrentModel {

  ConditionModel? condition;
  double? temp_c;
  CurrentModel({
    required this.condition,
    required this.temp_c,
  });

  factory CurrentModel.fromJson(Map<String, dynamic>json){
    return CurrentModel(
      condition: ConditionModel.fromJson(json['condition']), 
      temp_c: json['temp_c']);
  }
  
}
