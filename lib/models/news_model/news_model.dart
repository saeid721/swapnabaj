class NewsModel {
  final String date;
  final String title;
  final String description;
  final String? fileUrl;

  NewsModel({
    required this.date,
    required this.title,
    required this.description,
    this.fileUrl,
  });

  factory NewsModel.fromDocument(Map<String, dynamic> data, String id) {
    return NewsModel(
      date: data['date'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      fileUrl: data['file_url'], // Fetching image URL from Firestore
    );
  }
}
