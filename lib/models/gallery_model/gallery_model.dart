class GalleryModel {
  final String title;
  final String description;
  final String? fileUrl;

  GalleryModel({
    required this.title,
    required this.description,
    this.fileUrl,
  });

  factory GalleryModel.fromDocument(Map<String, dynamic> data, String id) {
    return GalleryModel(
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      fileUrl: data['file_url'], // Fetching image URL from Firestore
    );
  }
}
