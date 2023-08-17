import 'package:flutter/material.dart';

import 'package:tasks_menegers/screen/bottom_navbar/bottom_navbar.dart';

import 'package:tasks_menegers/screen/home_screen/home_page/home_page_controller.dart';

import 'package:tasks_menegers/utility/appbar/appbar.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  void initState() {
    homePageController.ReadAppBarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TaskAppBar(context, homePageController.ProfileData),
        body: GetBuilder<HomePageController>(builder: (homePageController) {
          return homePageController.widgetOptions
              .elementAt(homePageController.TabIndex);
        }),


        bottomNavigationBar: GetBuilder<HomePageController>(

          builder: (homePageController) {
            return appBottomNav(
                homePageController.TabIndex, homePageController.onItemTapped);
          },


        ),
    );
  }
}
