class Member {
  final String name;
  final String fatherName;
  final String motherName;
  final String nid;
  final String phone;
  final String email;
  final String address;
  final String? fileUrl;

  Member({
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.nid,
    required this.phone,
    required this.email,
    required this.address,
    this.fileUrl,
  });

  factory Member.fromDocument(Map<String, dynamic> data, String id) {
    return Member(
      name: data['name'] ?? '',
      fatherName: data['father_name'] ?? '',
      motherName: data['mother_name'] ?? '',
      nid: data['nid'] ?? '',
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      address: data['address'] ?? '',
      fileUrl: data['file_url'], // Fetching image URL from Firestore
    );
  }
}
