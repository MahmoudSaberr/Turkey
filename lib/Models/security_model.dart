class SecurityModel {
  SecurityModel({
    required this.answer_2,
    required this.answer_1,
  });
  late final String answer_2;
  late final String answer_1;

  SecurityModel.fromJson(Map<String, dynamic> json){
    answer_2 = json['answer_2'];
    answer_1 = json['answer_1'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['answer_2'] = answer_2;
    data['answer_1'] = answer_1;
    return data;
  }
}