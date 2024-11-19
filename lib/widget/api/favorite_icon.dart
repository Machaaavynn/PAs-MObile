import 'package:get/get.dart';

class Post {
  final String strTeam;
  final String strBadge;
  var isFavorite = false.obs; 

  Post({required this.strTeam, required this.strBadge});
}
  