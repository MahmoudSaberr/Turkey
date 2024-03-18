
class LevelModel {
  LevelModel({
    this.videoUrl,
    this.id,
    this.title,
  });

  String? videoUrl;
  String? id;
  String? title;

  LevelModel.fromJson(Map<String, dynamic> json) {
    videoUrl = json['video_url'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['video_url'] = videoUrl;
    data['id'] = id;
    data['title'] = title;
    return data;
  }

}
