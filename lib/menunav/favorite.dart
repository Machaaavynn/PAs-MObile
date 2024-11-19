import 'package:flutter/material.dart';
import 'package:pas1_mobile_brillian_11pplg2/Api/PostModel.dart';
import 'package:pas1_mobile_brillian_11pplg2/database/database.dart';
import 'package:pas1_mobile_brillian_11pplg2/widget/favorite/ReusableCard.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<PostModel> favoriteList = [];

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    final favorites = await DatabaseHelper.instance.getFavorites();
    setState(() {
      favoriteList = favorites;
    });
  }

  Future<void> deleteFavorite(String teamName) async {
    await DatabaseHelper.instance.removeFavorite(teamName);
    fetchFavorites(); 
  }

  void showDeleteConfirmationDialog(String teamName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReusableDialog(
          title: "Konfirmasi",
          message: "Anda yakin untuk menghapus data favorit?",
          onCancel: () => Navigator.of(context).pop(),
          onConfirm: () {
            deleteFavorite(teamName);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: favoriteList.isEmpty
          ? EmptyStateMessage(message: "No favorite teams")
          : ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final post = favoriteList[index];
                return ReusableCard(
                  leading: post.strBadge.isNotEmpty
                      ? Image.network(
                          post.strBadge,
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.broken_image, color: Colors.white),
                        )
                      : Icon(Icons.image, color: Colors.white),
                  title: post.strTeam,
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => showDeleteConfirmationDialog(post.strTeam),
                  ),
                );
              },
            ),
    );
  }
}
