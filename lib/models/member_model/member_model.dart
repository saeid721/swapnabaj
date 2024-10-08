class Member {
  final String memberId;
  final String name;
  final String fatherName;
  final String motherName;
  final String nid;
  final String phone;
  final String email;
  final String address;
  final String? fileName;

  Member({
    required this.memberId,
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.nid,
    required this.phone,
    required this.email,
    required this.address,
    this.fileName,
  });

  factory Member.fromDocument(Map<String, dynamic> data, String id) {
    return Member(
      memberId: id, // Use the document ID
      name: data['name'] ?? '',
      fatherName: data['father_name'] ?? '',
      motherName: data['mother_name'] ?? '',
      nid: data['nid'] ?? '',
      phone: data['phone'] ?? '',
      email: data['email'] ?? '',
      address: data['address'] ?? '',
      fileName: data['file_name'], // Ensure this matches your Firestore field name
    );
  }
}
