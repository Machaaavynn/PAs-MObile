import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_brillian_11pplg2/controller/bottomnav_controller.dart';
import 'package:pas1_mobile_brillian_11pplg2/menunav/api1.dart';
import 'package:pas1_mobile_brillian_11pplg2/menunav/favorite.dart';
import 'package:pas1_mobile_brillian_11pplg2/menunav/profile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DhasboardController dashboardController =
        Get.put(DhasboardController());

    final List<Widget> menus = [
      ApiListView(),
      Favorite(),
      Profile(),
    ];

    return Obx(() {
      return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: (index) {
            dashboardController.selectedIndex.value = index;
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: Colors.grey[850],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
