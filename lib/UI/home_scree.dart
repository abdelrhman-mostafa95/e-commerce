import 'package:flutter/material.dart';

class HomeScree extends StatelessWidget {
  static const String routeName = '/home';
  const HomeScree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled,), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.grid_view,),label: 'view'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border,), label:'favorite' ),
        BottomNavigationBarItem(icon: Icon(Icons.person,), label: 'profile'),
      ], backgroundColor: Colors.transparent,),
    );
  }
}
