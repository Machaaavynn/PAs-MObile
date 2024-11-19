// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_brillian_11pplg2/model/profilemodel.dart';
import 'package:pas1_mobile_brillian_11pplg2/navigasi/loginpage.dart';
import 'package:pas1_mobile_brillian_11pplg2/widget/profile/card.dart';
import 'package:pas1_mobile_brillian_11pplg2/widget/profile/custombuttom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
  final ProfileModel profile = ProfileModel(
    name: 'Brillian Aditya Jaya Suhargo',
    role: 'Pemilik PT Suhargo Grup',
    imagePath: 'assets/profile.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[900],
        title: SizedBox.shrink(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomCard(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(profile.imagePath),
                ),
                SizedBox(height: 16),
                Text(
                  profile.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  profile.role,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: 'Logout',
                  color: Colors.black,
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isLoggedIn', false);
                    Get.snackbar('Logout', 'Anda telah logout.',
                        backgroundColor: Colors.blue, colorText: Colors.white);
                    Get.offAll(LoginPage());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
