import 'package:ecommerce_app_v2/UI/home_screen/cubit/Home_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabs/category_tab/category_tab.dart';
import '../../tabs/favorite_tab/favorite_tab.dart';
import '../../tabs/home_tab/home_tab.dart';
import '../../tabs/profile_tab/profile_tab.dart';

class HomeViewModel extends Cubit<HomeStates>{
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    CategoryTab(),
    FavoriteTab(),
    ProfileTab(),
  ];
  HomeViewModel() : super(HomeInitialStates());
changeSelectedIndex(int selectedIndex){
  emit(HomeInitialStates());
  currentIndex = selectedIndex ;
  emit(ChangeSelectedIndexStates());
}
}