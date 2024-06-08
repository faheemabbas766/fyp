class AdminReportModel {
  final int reportId;
  final String reporterCnic;
  final String reporterName;
  final String reporterPicture;
  final String reporterGender;
  final String reporterRole;
  final String reportType;
  final int reportedItemId;
  final String reportedItemContent;
  final DateTime reportDate;
  final String reportStatus;
  final String reportReason;
  final String postImage;
  final String postText;
  final DateTime postDate;

  AdminReportModel({
    required this.reportId,
    required this.reporterCnic,
    required this.reporterName,
    required this.reporterPicture,
    required this.reporterGender,
    required this.reporterRole,
    required this.reportType,
    required this.reportedItemId,
    required this.reportedItemContent,
    required this.reportDate,
    required this.reportStatus,
    required this.reportReason,
    required this.postImage,
    required this.postText,
    required this.postDate,
  });

  factory AdminReportModel.fromJson(Map<String, dynamic> json) {
    return AdminReportModel(
      reportId: json['ReportId'],
      reporterCnic: json['ReporterCnic'],
      reporterName: json['ReporterName'],
      reporterPicture: json['ReporterPicture'],
      reporterGender: json['ReporterGender'],
      reporterRole: json['ReporterRole'],
      reportType: json['ReportType'],
      reportedItemId: json['ReportedItemId'],
      reportedItemContent: json['ReportedItemContent'],
      reportDate: DateTime.parse(json['ReportDate']),
      reportStatus: json['ReportStatus'],
      reportReason: json['ReportReason'],
      postImage: json['PostImage'],
      postText: json['PostText'],
      postDate: DateTime.parse(json['PostDate']),
    );
  }
}
