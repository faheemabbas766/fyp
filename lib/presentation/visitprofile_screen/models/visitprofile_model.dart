class VisitProfileModel {
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
  final List<PostModel> userPosts;

  VisitProfileModel({
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
    required this.userPosts,
  });

  factory VisitProfileModel.fromJson(Map<String, dynamic> json) {
    return VisitProfileModel(
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
      userPosts: (json['userPosts'] as List<dynamic>)
          .map((postJson) => PostModel.fromJson(postJson))
          .toList(),
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
    'userPosts': userPosts.map((post) => post.toJson()).toList(),
  };
}

class PostModel {
  final int postId;
  final DateTime postDate;
  final String postText;
  final String? postImage;
  final String postUc;
  final String userName;
  final String userCnic;
  final String userPicture;
  final String accountType;
  final String position;
  final int totalRating;
  final String? recentComment;
  final DateTime? recentCommentDate;
  final String status;
  final String politicianId;
  int rateScore; // Added field
  final bool followed; // Added field

  PostModel({
    required this.postId,
    required this.postDate,
    required this.postText,
    required this.postUc,
    required this.userName,
    required this.userCnic,
    required this.userPicture,
    required this.accountType,
    required this.position,
    required this.totalRating,
    required this.status,
    required this.politicianId,
    required this.rateScore,
    required this.followed,
    this.postImage,
    this.recentComment,
    this.recentCommentDate,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      postId: json['post_id'],
      postDate: DateTime.parse(json['post_date']),
      postText: json['post_text'],
      postImage: json['post_image'],
      postUc: json['post_uc']??'',
      userName: json['user_name']??'',
      userCnic: json['user_cnic']??'',
      userPicture: json['user_picture']??'',
      accountType: json['account_type']??'',
      position: json['position']??'',
      totalRating: json['total_rating']??0,
      recentComment: json['recent_comment']??'',
      recentCommentDate: json['recent_comment_date'] != null
          ? DateTime.parse(json['recent_comment_date'])
          : null,
      status: json['status']??'',
      politicianId: json['politician_id']??'',
      rateScore: json['rate_score']?? 0,
      followed: json['followed']??'',
    );
  }

  Map<String, dynamic> toJson() => {
    'post_id': postId,
    'post_date': postDate,
    'post_text': postText,
    'post_image': postImage,
    'post_uc': postUc,
    'user_name': userName,
    'user_cnic': userCnic,
    'user_picture': userPicture,
    'account_type': accountType,
    'position': position,
    'total_rating': totalRating,
    'recent_comment': recentComment,
    'recent_comment_date':
    recentCommentDate != null ? recentCommentDate!.toIso8601String() : null,
    'status': status,
    'politician_id': politicianId,
    'rate_score': rateScore,
    'followed': followed,
  };
}
