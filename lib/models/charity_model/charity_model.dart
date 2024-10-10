class CharityModel {
  final String date;
  final String title;
  final String number;
  final String description;
  final String? fileUrl;

  CharityModel({
    required this.date,
    required this.title,
    required this.number,
    required this.description,
    this.fileUrl,
  });

  factory CharityModel.fromDocument(Map<String, dynamic> data, String id) {
    return CharityModel(
      date: data['date'] ?? '',
      title: data['title'] ?? '',
      number: data['number'] ?? '',
      description: data['description'] ?? '',
      fileUrl: data['file_url'], // Fetching image URL from Firestore
    );
  }
}
