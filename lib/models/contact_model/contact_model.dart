class ContactModel {
  final String phone;
  final String email;
  final String website;
  final String address;

  ContactModel({
    required this.phone,
    required this.email,
    required this.website,
    required this.address,
  });

  factory ContactModel.fromDocument(Map<String, dynamic> data, String id) {
    return ContactModel(
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      website: data['website'] ?? '',
      address: data['address'] ?? '',
    );
  }
}
