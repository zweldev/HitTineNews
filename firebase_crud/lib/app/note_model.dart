class NoteModel {
  String? id;
  String title;
  String content;
  String? createdTime;

  NoteModel(
      {this.id, required this.title, required this.content, this.createdTime});

  NoteModel copyWith(
  {String? id,
  String? title,
  String? content,
  String? createdTime,}
  ) {
    return NoteModel(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        createdTime: createdTime ?? this.createdTime);
  }

  factory NoteModel.fromJSON(dynamic data) {
    return NoteModel(
      id: data['id'],
      title: data['title'],
      content: data['content'],
      createdTime: data['createdTime'],
    );
  }

  Map<String, dynamic> toJSON() => {
    'id': id,
    'title':title,
    'content':content,
    'createdTime':createdTime
  };
}
