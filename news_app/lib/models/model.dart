class Source {
  String id;
  String name;

  Source({this.id, this.name} );

  factory Source.fromJson(Map<String,dynamic>json){
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.publishedAt,
      this.url,
      this.urlToImage,
      this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        source: Source.fromJson(json['source']),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content'],
    );
  }
}
