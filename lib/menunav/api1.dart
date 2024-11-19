import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_brillian_11pplg2/Api/PostController.dart';
import 'package:pas1_mobile_brillian_11pplg2/Api/TeamDetailView.dart';

import '../database/database.dart';

class ApiListView extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            final post = postController.postList[index];
            return Card(
              color: Colors.grey[850],
              child: ListTile(
                leading: post.strBadge.isNotEmpty
                    ? Image.network(
                        post.strBadge,
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.broken_image, color: Colors.white),
                      )
                    : Icon(Icons.image, color: Colors.white),
                title: Text(
                  post.strTeam,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Obx(() => IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: post.isFavorite.value
                            ? Colors.red
                            : Colors.grey[500],
                      ),
                      onPressed: () async {
                        post.isFavorite.value = !post.isFavorite.value;
                        if (post.isFavorite.value) {
                          await DatabaseHelper.instance.addFavorite(post);
                        } else {
                          await DatabaseHelper.instance
                              .removeFavorite(post.strTeam);
                        }
                      },
                    )),
                onTap: () {
                  Get.to(TeamDetailView(post: post));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
