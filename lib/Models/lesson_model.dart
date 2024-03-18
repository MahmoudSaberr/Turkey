class LessonModel {
  String? id;
  String? title;
  int? level;
  String? content;
  String? lessonType;
  String? videoUrl;
  List<String>? trStatements, enStatements, arStatements;
  // Map<String, Statement>? statements;
  Map<String, List<String>>? statementsWords;
  Map<String, Word>? words;
  dynamic creationDate;
  dynamic modificationDate;

  LessonModel({
    this.id,
    this.title,
    this.level,
    this.lessonType,
    this.content,
    this.videoUrl,
  //  this.statements,
    this.trStatements,
    this.enStatements,
    this.arStatements,
    this.statementsWords,
    this.words,
    this.creationDate,
    this.modificationDate,
  });

  LessonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    level = json['level'];
    lessonType = json['lessonType'];
    content = json['content'];
    videoUrl = json['videoUrl'];
/*    statements = (json['statements'] as Map<String, dynamic>).map((key, value) {
      return MapEntry(key, Statement.fromJson(value));
    });*/
    trStatements = List.castFrom<dynamic, String>(json['trStatements']);
    arStatements = List.castFrom<dynamic, String>(json['arStatements']);
    enStatements = List.castFrom<dynamic, String>(json['enStatements']);
    statementsWords = (json['statementsWords'] as Map<String, dynamic>).map(
      (key, value) {
        return MapEntry(key, List<String>.from(value));
      },
    );
    words = (json['words'] as Map<String, dynamic>).map((key, value) {
      return MapEntry(key, Word.fromJson(value));
    });
    creationDate = json['creationDate'];
    modificationDate = json['modificationDate'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'level': level,
      'lessonType': lessonType,
      'content': content,
      'videoUrl': videoUrl,

/*
      'statements':
          statements?.map((key, value) => MapEntry(key, value.toJson())),
*/
      'statementsWords': statementsWords,
      'words': words?.map((key, value) => MapEntry(key, value.toJson())),
      'creationDate': creationDate,
      'modificationDate': modificationDate,
    };
  }
}

class Statement {
  String? english;
  String? arabic;

  //String? url;

  Statement({
    this.english,
    this.arabic,
    //   this.url,
  });

  Statement.fromJson(Map<String, dynamic> json) {
    english = json['english'];
    arabic = json['arabic'];
    //   url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'english': english,
      'arabic': arabic,
      //   'url': url,
    };
  }
}

class Word {
  String? english;
  String? arabic;

  Word({
    this.english,
    this.arabic,
  });

  Word.fromJson(Map<String, dynamic> json) {
    english = json['english'];
    arabic = json['arabic'];
  }

  Map<String, dynamic> toJson() {
    return {
      'english': english,
      'arabic': arabic,
    };
  }
}
