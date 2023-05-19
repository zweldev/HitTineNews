class NewsModel {
  final Source source;
  final String? authorName;
  final String title;
  final String? description;
  final String url;
  final String? urlToImg;
  final String publishedAt;
  final String? content;

  NewsModel({
    required this.source,
    this.authorName,
    required this.title,
    this.description,
    required this.url,
    this.urlToImg,
    required this.publishedAt,
    this.content,
  });

  factory NewsModel.fromJSON(Map<String, dynamic> data) {
    return NewsModel(
        source: Source.fromJSON(data['source']),
        authorName: data['author'],
        title: data['title'],
        description: data['description'],
        url: data['url'],
        urlToImg: data['urlToImage'],
        publishedAt: data['publishedAt'],
        content: data['content']);
  }

  Map<String, dynamic> toJSON() => {
        "source": source,
        "author": authorName,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImg,
        "publishedAt": publishedAt,
        "content": content
      };

  NewsModel copyWith(
    Source? source,
    String? authorName,
    String? title,
    String? description,
    String? url,
    String? urlToImg,
    String? publishedAt,
    String? content,
  ) {
    return NewsModel(
        source: source ?? this.source,
        authorName: authorName ?? this.authorName,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImg: urlToImg ?? this.urlToImg,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content);
  }
}

class Source {
  final String? id;
  final String name;

  Source({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toJson() => {"id": id, "name": name};

  factory Source.fromJSON(Map<String, dynamic> data) {
    return Source(id: data['id'], name: data['name']);
  }

  Source copyWith(
    String? id,
    String? name,
  ) {
    return Source(id: id ?? this.id, name: name ?? this.name);
  }
}
