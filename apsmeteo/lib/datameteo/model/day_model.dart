// ignore_for_file: public_member_api_docs, sort_constructors_first
class DayModel {
  int daily_chance_of_rain;
  DayModel({
    required this.daily_chance_of_rain,
  });

  factory DayModel.fromJson(Map<String, dynamic>json){
    return DayModel(
      daily_chance_of_rain: json['daily_chance_of_rain'] ?? 0);
  }

}
