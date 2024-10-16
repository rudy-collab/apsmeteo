// ignore_for_file: public_member_api_docs, sort_constructors_first
class ConditionModel {

  String icon;
  String text;
  ConditionModel({
    required this.icon,
    required this.text,
  });

  factory ConditionModel.fromJson(Map<String, dynamic>json){
    return ConditionModel(
      icon: json['icon'] ?? '', 
      text: json['text'] ?? '');
  }

  
}
