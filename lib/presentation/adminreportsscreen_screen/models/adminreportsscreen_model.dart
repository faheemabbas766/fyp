class ReportModel {
  final int reportId;
  final String reporterCnic;
  final String reporterName;
  final String reporterPicture;
  final String reporterGender;
  final String reportType;
  final int reportedItemId;
  final String reportedItemContent;
  final String reportedCnic;
  final String reportedName;
  final String reportedPicture;
  final String reportedGender;
  final DateTime reportDate;
  final String reportStatus;
  final String reportReason;

  ReportModel({
    required this.reportId,
    required this.reporterCnic,
    required this.reporterName,
    required this.reporterPicture,
    required this.reporterGender,
    required this.reportType,
    required this.reportedItemId,
    required this.reportedItemContent,
    required this.reportedCnic,
    required this.reportedName,
    required this.reportedPicture,
    required this.reportedGender,
    required this.reportDate,
    required this.reportStatus,
    required this.reportReason,
  });

  // Convert a ReportModel into a Map. The keys must correspond to the JSON keys.
  Map<String, dynamic> toJson() {
    return {
      'report_id': reportId,
      'reporter_cnic': reporterCnic,
      'reporter_name': reporterName,
      'reporter_picture': reporterPicture,
      'reporter_gender': reporterGender,
      'report_type': reportType,
      'reported_item_id': reportedItemId,
      'reported_item_content': reportedItemContent,
      'reported_cnic': reportedCnic,
      'reported_name': reportedName,
      'reported_picture': reportedPicture,
      'reported_gender': reportedGender,
      'report_date': reportDate.toIso8601String(),
      'report_status': reportStatus,
      'report_reason': reportReason,
    };
  }

  // Convert a Map into a ReportModel. The keys must correspond to the JSON keys.
  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      reportId: json['report_id'],
      reporterCnic: json['reporter_cnic'],
      reporterName: json['reporter_name'],
      reporterPicture: json['reporter_picture'],
      reporterGender: json['reporter_gender'],
      reportType: json['report_type'],
      reportedItemId: json['reported_item_id'],
      reportedItemContent: json['reported_item_content'],
      reportedCnic: json['reported_cnic'],
      reportedName: json['reported_name'],
      reportedPicture: json['reported_picture'],
      reportedGender: json['reported_gender'],
      reportDate: DateTime.parse(json['report_date']),
      reportStatus: json['report_status'],
      reportReason: json['report_reason'],
    );
  }

  // Convert a List of Maps into a List of ReportModels
  static List<ReportModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ReportModel.fromJson(json)).toList();
  }

  // Convert a List of ReportModels into a List of Maps
  static List<Map<String, dynamic>> toJsonList(List<ReportModel> reports) {
    return reports.map((report) => report.toJson()).toList();
  }
}
