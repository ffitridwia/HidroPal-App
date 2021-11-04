import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hidro_pal/app/routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => Get.toNamed(Routes.HOME),
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () => Get.toNamed(Routes.CATALOG),
              icon: Icon(Icons.menu_open),
            ),
            IconButton(
              onPressed: () => Get.toNamed(Routes.PROFILE),
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
