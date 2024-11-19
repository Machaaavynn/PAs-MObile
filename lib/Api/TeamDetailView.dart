// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pas1_mobile_brillian_11pplg2/Api/PostModel.dart';

class TeamDetailView extends StatelessWidget {
  final PostModel post;

  TeamDetailView({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.grey[900], 
      appBar: AppBar(
        title: Text(post.strTeam),
        backgroundColor: Colors.black, 
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                post.strBadge,
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.broken_image,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              post.strTeam,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              ),
            ),
            SizedBox(height: 8),
            Text(
              post.strDescriptionEN,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, 
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Di Buat Tahun: ${post.intFormedYear}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, 
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Stadion: ${post.strStadium}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, 
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lokasi: ${post.strLocation}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Main Di Liga: ${post.strLeague}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
