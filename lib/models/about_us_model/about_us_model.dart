class AboutUs {
  final String title;
  final String subTitle;
  final String description;
  final String? fileUrl;

  AboutUs({
    required this.title,
    required this.subTitle,
    required this.description,
    this.fileUrl,
  });

  factory AboutUs.fromDocument(Map<String, dynamic> data, String id) {
    return AboutUs(
      title: data['title'] ?? '',
      subTitle: data['sub_title'] ?? '',
      description: data['description'] ?? '',
      fileUrl: data['file_url'], // Fetching image URL from Firestore
    );
  }
}
