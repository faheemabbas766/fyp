import 'package:flutter/material.dart';
import '../../../core/global/global.dart';
import '../../../core/services/base_service.dart';
import '../models/comment_model.dart';
class CommentProvider extends ChangeNotifier {
  late List<CommentModel> commentsList;
  bool isLoading = true;
  loadData() async {
    commentsList = await getAllCommentsById(GlobalData.postId);
    isLoading = false;
    notifyListeners();
  }
  Future<List<CommentModel>> getAllCommentsById(String id) async {
    Map<String, String> requestBody ={
      'postId':id.toString(),
    };
    dynamic response = await BaseService.postRequest("Main/AllCommentsByPostId", requestBody);
    final parsed = response.cast<Map<String, dynamic>>();
    return parsed.map<CommentModel>((json) => CommentModel.fromJson(json)).toList();
  }
  @override
  void dispose() {
    super.dispose();
  }
}
