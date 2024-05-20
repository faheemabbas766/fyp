class FollowingModel {
  final String id;
  final String userCnic;
  final String userName;
  final String userPicture;
  bool followedBack;

  FollowingModel({
    required this.id,
    required this.userCnic,
    required this.userName,
    required this.userPicture,
    required this.followedBack,
  });

  factory FollowingModel.fromJson(Map<String, dynamic> json) {
    return FollowingModel(
      id: json['\$id'] as String,
      userCnic: json['user_cnic'] as String,
      userName: json['user_name'] as String,
      userPicture: json['user_picture'] as String,
      followedBack: json['followed_back'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '\$id': id,
      'user_cnic': userCnic,
      'user_name': userName,
      'user_picture': userPicture,
      'followed_back': followedBack,
    };
  }
}
