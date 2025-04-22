import 'package:ecommerce_app_v2/UI/home_screen/cubit/Home_States.dart';
import 'package:ecommerce_app_v2/UI/home_screen/cubit/Home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../tabs/category_tab/category_tab.dart';
import '../tabs/favorite_tab/favorite_tab.dart';
import '../tabs/home_tab/home_tab.dart';
import '../tabs/profile_tab/profile_tab.dart';

class HomeScree extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<HomeScree> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScree> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo_home_screen.png',
                  height: 24,
                ),
                SizedBox(height: 12),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade900),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.blue.shade900),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "What do you search for?",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Icon(Icons.shopping_cart_outlined,
                          color: Colors.blue.shade900),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).colorScheme.primary,
            ),
            child: Container(
              clipBehavior: Clip.hardEdge,
              //or better look(and cost) using Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: BottomNavigationBar(
                backgroundColor: Color(0xFF004182),
                currentIndex: viewModel.currentIndex,
                onTap: (index) {
                  viewModel.changeSelectedIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: viewModel.currentIndex == 0
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // white circle
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(8), // adjust size
                            child: Icon(Icons.home_outlined,
                                color: Colors.blue.shade900),
                          )
                        : Icon(Icons.home_outlined, color: Colors.white),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: viewModel.currentIndex == 1
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // white circle
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(8), // adjust size
                            child: Icon(Icons.grid_view,
                                color: Colors.blue.shade900),
                          )
                        : Icon(Icons.grid_view, color: Colors.white),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: viewModel.currentIndex == 2
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // white circle
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(8), // adjust size
                            child: Icon(Icons.favorite_border,
                                color: Colors.blue.shade900),
                          )
                        : Icon(Icons.favorite_border, color: Colors.white),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: viewModel.currentIndex == 3
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // white circle
                              shape: BoxShape.circle,
                            ),
                            padding: EdgeInsets.all(8), // adjust size
                            child:
                                Icon(Icons.person, color: Colors.blue.shade900),
                          )
                        : Icon(Icons.person, color: Colors.white),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
          body: viewModel.tabs[viewModel.currentIndex],
        );
      },
    );
  }
}
