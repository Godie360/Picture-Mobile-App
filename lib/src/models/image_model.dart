class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  // Named constructor for creating an instance from JSON
  ImageModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'] ?? 0,
        url = parsedJson['url'] ?? '',
        title = parsedJson['title'] ?? '';
  }
