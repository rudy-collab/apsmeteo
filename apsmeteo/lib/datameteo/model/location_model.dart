// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocationModel {

  String? name;
  String? country;
  LocationModel({
    required this.name,
    required this.country,
  });

  factory LocationModel.fromJson(Map<String, dynamic>json){
    return LocationModel(
      name: json['name'] ?? '', 
      country: json['country'] ?? '');
  }
}
