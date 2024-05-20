class Politician {
  String id;
  int politicianId;
  String politicianCNIC;
  String politicianPosition;
  String politicianParty;
  String userFullName;
  String userPassword;
  String userProvince;
  String userDistrict;
  String userTehsil;
  String userUC;
  String userPhone;
  String userPic;
  String userGender;
  DateTime userCreatedDate;
  int userIsDeleted;
  String userRole;

  Politician({
    required this.id,
    required this.politicianId,
    required this.politicianCNIC,
    required this.politicianPosition,
    required this.politicianParty,
    required this.userFullName,
    required this.userPassword,
    required this.userProvince,
    required this.userDistrict,
    required this.userTehsil,
    required this.userUC,
    required this.userPhone,
    required this.userPic,
    required this.userGender,
    required this.userCreatedDate,
    required this.userIsDeleted,
    required this.userRole,
  });

  factory Politician.fromJson(Map<String, dynamic> json) {
    return Politician(
      id: json['\$id'],
      politicianId: json['PoliticianId'],
      politicianCNIC: json['PoliticianCNIC'],
      politicianPosition: json['PoliticianPosition'],
      politicianParty: json['PoliticianParty'],
      userFullName: json['UserFullName'],
      userPassword: json['UserPassword'],
      userProvince: json['UserProvince'],
      userDistrict: json['UserDistrict'],
      userTehsil: json['UserTehsil'],
      userUC: json['UserUC'],
      userPhone: json['UserPhone'],
      userPic: json['UserPic'],
      userGender: json['UserGender'],
      userCreatedDate: DateTime.parse(json['UserCreatedDate']),
      userIsDeleted: json['UserIsDeleted'],
      userRole: json['UserRole'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '\$id': id,
      'PoliticianId': politicianId,
      'PoliticianCNIC': politicianCNIC,
      'PoliticianPosition': politicianPosition,
      'PoliticianParty': politicianParty,
      'UserFullName': userFullName,
      'UserPassword': userPassword,
      'UserProvince': userProvince,
      'UserDistrict': userDistrict,
      'UserTehsil': userTehsil,
      'UserUC': userUC,
      'UserPhone': userPhone,
      'UserPic': userPic,
      'UserGender': userGender,
      'UserCreatedDate': userCreatedDate.toIso8601String(),
      'UserIsDeleted': userIsDeleted,
      'UserRole': userRole,
    };
  }
}
