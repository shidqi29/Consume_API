class Album {
  final int? albumId;
  final int id;
  final String title;

  Album({
    this.albumId,
    required this.id,
    required this.title,
  });

  factory Album.fromMap(Map<String, dynamic> data) {
    return Album(
      albumId: data["albumId"],
      id: data["id"],
      title: data["title"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "albumId": albumId,
      "id": id,
      "title": title,
    };
  }
}
