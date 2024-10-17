class GalleryModel {
  final String imageTitle;
  final String description;
  final String? fileUrl;

  GalleryModel({
    required this.imageTitle,
    required this.description,
    this.fileUrl,
  });

  factory GalleryModel.fromDocument(Map<String, dynamic> data, String id) {
    return GalleryModel(
      imageTitle: data['title'] ?? '',
      description: data['description'] ?? '',
      fileUrl: data['file_url'] ?? 'assets/images/placeholder.png',
    );
  }
}
