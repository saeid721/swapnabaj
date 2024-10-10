class EventModel {
  final String title;
  final String date;
  final String location;
  final String description;
  final String id;

  EventModel({
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.id,
  });

  factory EventModel.fromDocument(Map<String, dynamic> data, String id) {
    return EventModel(
      title: data['title'] ?? '',
      date: data['date'] ?? '',
      location: data['location'] ?? '',
      description: data['description'] ?? '',
      id: id,
    );
  }
}