import 'dart:convert';

class News {
  final String? imgURL;
  final String newsTitle;
  final String newsBody;
  final String datePublished;
  final String publishedBy;

  News({
    required this.newsTitle,
    required this.newsBody,
    required this.datePublished,
    required this.publishedBy,
    this.imgURL,
  });

  News copyWith({
    String? imgURL,
    required String newsTitle,
    String? newsBody,
    required String datePublished,
    required String publishedBy,
  }) {
    return News(
      imgURL: imgURL ?? this.imgURL,
      newsTitle: newsTitle,
      newsBody: newsBody ?? this.newsBody,
      datePublished: datePublished,
      publishedBy: publishedBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imgURL': imgURL,
      'newsTitle': newsTitle,
      'newsBody': newsBody,
      'datePublished': datePublished,
      'publishedBy': publishedBy,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      imgURL: map['urlToImage'],
      newsTitle: map['title'] ?? "--",
      newsBody: map['content'] ?? "",
      datePublished: map['publishedAt'] ?? "--",
      publishedBy: map['author'] ?? "--",
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) =>
      News.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'News(imgURL: $imgURL, newsTitle: $newsTitle, newsBody: $newsBody, datePublished: $datePublished, publishedBy: $publishedBy)';
  }

  @override
  bool operator ==(covariant News other) {
    if (identical(this, other)) return true;

    return other.imgURL == imgURL &&
        other.newsTitle == newsTitle &&
        other.newsBody == newsBody &&
        other.datePublished == datePublished &&
        other.publishedBy == publishedBy;
  }

  @override
  int get hashCode {
    return imgURL.hashCode ^
        newsTitle.hashCode ^
        newsBody.hashCode ^
        datePublished.hashCode ^
        publishedBy.hashCode;
  }
}
