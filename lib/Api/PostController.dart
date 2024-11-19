// controllers/post_controller.dart
import 'package:get/get.dart';
import 'package:pas1_mobile_brillian_11pplg2/Api/ApiService.dart';
import 'package:pas1_mobile_brillian_11pplg2/Api/PostModel.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <PostModel>[].obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiService().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}