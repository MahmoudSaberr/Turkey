class RulesModel {
  RulesModel({
    this.id,
    this.title,
    this.type,
    this.videoUrl,
    this.creationDate,
    this.modificationDate,
  });

  String? id;
  String? title;
  String? type;
  String? videoUrl;
  String? creationDate;
  String? modificationDate;

  RulesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    videoUrl = json['videoUrl'];
    creationDate = json['creationDate'];
    modificationDate = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['videoUrl'] = videoUrl;
    return data;
  }
}
