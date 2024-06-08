class AdminRequestProfileModel {
  final String id;
  final String cnic;
  final String name;
  final String picture;
  final String userType;
  final int totalPost;
  final String position;
  final int totalFollowed;
  final int totalFollowing;
  final String province;
  final String district;
  final String tehsil;
  final String uc;
  final String phone;
  final String gender;
  final DateTime createdDate;
  bool isFollow;
  final double postsRating; // Added field
  final int rank; // Added field

  AdminRequestProfileModel({
    required this.id,
    required this.cnic,
    required this.name,
    required this.picture,
    required this.userType,
    required this.totalPost,
    required this.position,
    required this.totalFollowed,
    required this.totalFollowing,
    required this.province,
    required this.district,
    required this.tehsil,
    required this.uc,
    required this.phone,
    required this.gender,
    required this.createdDate,
    required this.isFollow,
    required this.postsRating, // Initialize new field
    required this.rank, // Initialize new field
  });

  factory AdminRequestProfileModel.fromJson(Map<String, dynamic> json) {
    return AdminRequestProfileModel(
      id: json['\$id'],
      cnic: json['user_cnic'],
      name: json['user_name'],
      picture: json['user_picture'],
      userType: json['user_type'],
      totalPost: json['user_total_post'],
      position: json['user_position'],
      totalFollowed: json['user_total_followed'],
      totalFollowing: json['user_total_following'],
      province: json['user_province'],
      district: json['user_distinct'],
      tehsil: json['user_tehsil'],
      uc: json['user_uc'],
      phone: json['user_phone'],
      gender: json['user_gender'],
      createdDate: DateTime.parse(json['created_date']),
      isFollow: json['is_follow'] == 'true',
      postsRating: json['postsRating'].toDouble(), // Parse new field
      rank: json['rank'], // Parse new field
    );
  }

  Map<String, dynamic> toJson() => {
    '\$id': id,
    'user_cnic': cnic,
    'user_name': name,
    'user_picture': picture,
    'user_type': userType,
    'user_total_post': totalPost,
    'user_position': position,
    'user_total_followed': totalFollowed,
    'user_total_following': totalFollowing,
    'user_province': province,
    'user_distinct': district,
    'user_tehsil': tehsil,
    'user_uc': uc,
    'user_phone': phone,
    'user_gender': gender,
    'created_date': createdDate.toIso8601String(),
    'is_follow': isFollow.toString(),
    'postsRating': postsRating, // Serialize new field
    'rank': rank, // Serialize new field
  };
}
