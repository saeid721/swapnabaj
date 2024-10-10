class AboutUsModel {
  final String title;
  final String subTitle;
  final String description;
  final String? fileUrl;

  AboutUsModel({
    required this.title,
    required this.subTitle,
    required this.description,
    this.fileUrl,
  });

  factory AboutUsModel.fromDocument(Map<String, dynamic> data, String id) {
    return AboutUsModel(
      title: data['title'] ?? '',
      subTitle: data['sub_title'] ?? '',
      description: data['description'] ?? '',
      fileUrl: data['file_url'], // Fetching image URL from Firestore
    );
  }
}
