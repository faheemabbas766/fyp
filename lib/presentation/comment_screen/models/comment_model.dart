class CommentModel {
  final String id;
  final String userCnic;
  final String userName;
  final String userPicture;
  final int commentId;
  final String commentText;
  final DateTime commentDate;
  final int postId;

  CommentModel({
    required this.id,
    required this.userCnic,
    required this.userName,
    required this.userPicture,
    required this.commentId,
    required this.commentText,
    required this.commentDate,
    required this.postId,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['\$id'],
      userCnic: json['user_cnic'],
      userName: json['user_name'],
      userPicture: json['user_picture'],
      commentId: json['comment_id'],
      commentText: json['comment_text'],
      commentDate: DateTime.parse(json['comment_date']),
      postId: json['post_id'],
    );
  }
}
