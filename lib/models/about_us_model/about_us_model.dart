class AboutUsModel {
  final String aboutUsDescription;
  final String ourVisionDescription;
  final String howWeOperateDescription;
  final String ourCommunityDescription;
  final String buildingLegacyDescription;
  final String? fileUrl;

  AboutUsModel({
    required this.aboutUsDescription,
    required this.ourVisionDescription,
    required this.howWeOperateDescription,
    required this.ourCommunityDescription,
    required this.buildingLegacyDescription,
    this.fileUrl,
  });

  factory AboutUsModel.fromDocument(Map<String, dynamic> data, String id) {
    return AboutUsModel(
      aboutUsDescription: data['aboutUsDescription'] ?? '',
      ourVisionDescription: data['ourVisionDescription'] ?? '',
      howWeOperateDescription: data['howWeOperateDescription'] ?? '',
      ourCommunityDescription: data['ourCommunityDescription'] ?? '',
      buildingLegacyDescription: data['buildingLegacyDescription'] ?? '',
      fileUrl: data['file_url'], // Fetching image URL from Firestore
    );
  }
}
