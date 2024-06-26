class PostDashboardModel {
  final String id;
  final int postId;
  final DateTime postDate;
  final String? postText;
  final String? postImage; // It could be null in the response
  final String postUC;
  final String userName;
  final String userCNIC;
  final String userPicture; // It could be null in the response
  final String accountType;
  final String position;
  final String politician_id;
  double totalRating;
  final String status;
  final int totalComment;
  final String? recentComment; // It could be null in the response
  final DateTime? recentCommentDate; // It could be null in the response
  bool followed;
  int rate_score;
  int popScore;

  PostDashboardModel({
    required this.id,
    required this.postId,
    required this.postDate,
    required this.postText,
    required this.postUC,
    required this.userName,
    required this.userCNIC,
    required this.userPicture,
    required this.accountType,
    required this.position,
    required this.totalRating,
    required this.status,
    required this.politician_id,
    required this.rate_score,
    this.postImage,
    this.recentComment,
    this.recentCommentDate,
    required this.totalComment,
    required this.followed,
    required this.popScore,
  });

  factory PostDashboardModel.fromJson(Map<String, dynamic> json) {
    return PostDashboardModel(
      id: json['\$id'],
      postId: json['post_id'],
      postDate: DateTime.parse(json['post_date']),
      postText: json['post_text'],
      postImage: json['post_image'],
      postUC: json['post_uc'],
      userName: json['user_name'],
      userCNIC: json['user_cnic'],
      userPicture: json['user_picture'],
      accountType: json['account_type'],
      position: json['position'],
      totalRating: json['total_rating'],
      recentComment: json['recent_comment'],
      recentCommentDate: json['recent_comment_date'] != null
          ? DateTime.parse(json['recent_comment_date']) : null,
      status: json['status'],
      rate_score: json['rate_score'] ?? 0,
      politician_id: json['politician_id'],
      followed: json['followed'],
      totalComment: json['count_comment'],
      popScore: json['popScore'],
    );
  }
}
