class ArticleModel {
  String title;
  String description;
  String urlToImage;

  ArticleModel({
    required this.title,
    required this.description,
    required this.urlToImage,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json["title"] ?? "", // Provide a default value if title is null
      description: json["description"] ??
          "", // Provide a default value if description is null
      urlToImage:
          json["urlToImage"] ?? "", // Provide a default value if url is null
    );
  }
}
