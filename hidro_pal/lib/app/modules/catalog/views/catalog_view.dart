import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hidro_pal/app/routes/app_pages.dart';
import '../controllers/catalog_controller.dart';

class CatalogView extends GetView<CatalogController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CatalogView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CatalogView is working',
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
