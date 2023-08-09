import 'package:flutter/material.dart';
import 'package:tasks_menegers/utility/text_style/text_style.dart';

BottomNavigationBar appBottomNav(currentIndex,onItemTapped){
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "New"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Completed "
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Canceled"
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Progress "
      )
    ],
    selectedItemColor: colorGreen,
    unselectedItemColor: colorLightGray,
    currentIndex: currentIndex,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: onItemTapped,
    type: BottomNavigationBarType.fixed,
  );
}