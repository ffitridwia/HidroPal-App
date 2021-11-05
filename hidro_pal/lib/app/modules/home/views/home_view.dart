import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hidro_pal/app/controllers/auth_controller.dart';
import 'package:hidro_pal/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home View"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 120,
              color: Colors.blue,
              alignment: Alignment.bottomLeft,
              child: Text(
                "HidroPal Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () => Get.toNamed(Routes.HOME),
              leading: Icon(
                Icons.home,
                size: 35,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () => Get.toNamed(Routes.PROFILE),
              leading: Icon(
                Icons.person,
                size: 35,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () => Get.toNamed(Routes.CATALOG),
              leading: Icon(
                Icons.menu_open,
                size: 35,
              ),
              title: Text(
                "Catalog",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_cart,
                size: 35,
              ),
              title: Text(
                "Cart",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              onTap: () => authC.logout(),
              leading: Icon(
                Icons.logout,
                size: 35,
              ),
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ],),
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () => Get.toNamed(
                  Routes.EDIT_PRODUCT,
                  arguments: listAllDocs[index].id, 
                ),
                title: Text(
                  "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}",
                ),
                subtitle: Text(
                  "Rp ${(listAllDocs[index].data() as Map<String, dynamic>)["price"]}",
                ),
                trailing: IconButton(
                  onPressed: () => 
                    controller.deleteProduct(listAllDocs[index].id),
                  icon: Icon(Icons.delete),
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: Icon(Icons.add),
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