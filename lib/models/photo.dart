class Photo {
  final int? albumId;
  final int? id;
  final String title;
  final String url;
  final String thumbnail;

  Photo({
    this.albumId,
    this.id,
    required this.title,
    required this.url,
    required this.thumbnail,
  });

  factory Photo.fromMap(Map<String, dynamic> data) {
    return Photo(
      albumId: data["albumId"],
      id: data["id"],
      title: data["title"],
      url: data["url"],
      thumbnail: data["thumbnail"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "albumId": albumId,
      "id": id,
      "title": title,
      "url": url,
      "thumbnail": thumbnail,
    };
  }
}
