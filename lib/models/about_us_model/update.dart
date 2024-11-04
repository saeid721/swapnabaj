class AboutUsModel {
  final String aboutUsDescription;
  final String ourVisionDescription;
  final String howWeOperateDescription;
  final String ourCommunityDescription;
  final String buildingLegacyDescription;
  final String? fileUrl;
  final String id; // Document ID

  AboutUsModel({
    required this.aboutUsDescription,
    required this.ourVisionDescription,
    required this.howWeOperateDescription,
    required this.ourCommunityDescription,
    required this.buildingLegacyDescription,
    this.fileUrl,
    required this.id,
  });

  // Factory constructor to convert Firestore document data into AboutUsModel
  factory AboutUsModel.fromDocument(Map<String, dynamic> data, String id) {
    return AboutUsModel(
      aboutUsDescription: data['aboutUsDescription'] ?? '',
      ourVisionDescription: data['ourVisionDescription'] ?? '',
      howWeOperateDescription: data['howWeOperateDescription'] ?? '',
      ourCommunityDescription: data['ourCommunityDescription'] ?? '',
      buildingLegacyDescription: data['buildingLegacyDescription'] ?? '',
      fileUrl: data['file_url'], // Fetching image URL from Firestore, if exists
      id: id, // Fetching document ID from Firestore
    );
  }

  // Method to convert AboutUsModel to a Map for saving/updating in Firestore
  Map<String, dynamic> toMap() {
    return {
      'aboutUsDescription': aboutUsDescription,
      'ourVisionDescription': ourVisionDescription,
      'howWeOperateDescription': howWeOperateDescription,
      'ourCommunityDescription': ourCommunityDescription,
      'buildingLegacyDescription': buildingLegacyDescription,
      'file_url': fileUrl, // Include file URL if available
    };
  }
}
