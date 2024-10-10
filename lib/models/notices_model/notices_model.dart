class NoticesModel {
  final String date;
  final String title;
  final String description;

  NoticesModel({
    required this.date,
    required this.title,
    required this.description,
  });

  factory NoticesModel.fromDocument(Map<String, dynamic> data, String id) {
    return NoticesModel(
      date: data['date'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
    );
  }
}
