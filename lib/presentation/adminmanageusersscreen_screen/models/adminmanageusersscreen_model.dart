class RequestModel {
  final String requestType;
  final String userCnic;
  final String fullName;
  final String userPic;
  final String requestStatus;
  final String requestDocument;
  final DateTime requestDate;
  final String platFrom;
  final String position;
  final String objection;

  RequestModel({
    required this.requestType,
    required this.userCnic,
    required this.fullName,
    required this.userPic,
    required this.requestStatus,
    required this.requestDocument,
    required this.requestDate,
    required this.platFrom,
    required this.position,
    required this.objection,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      requestType: json['request_type'],
      userCnic: json['User_cnic'],
      fullName: json['full_name'],
      userPic: json['user_pic'],
      requestStatus: json['request_status'],
      requestDocument: json['request_document'],
      requestDate: DateTime.parse(json['request_date']),
      platFrom: json['platform']??"",
      position: json['position']??"",
      objection: json['objection']??"",
    );
  }
}
