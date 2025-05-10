import 'package:ecommerce_app_v2/domain/entities/LoginResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_v2/domain/entities/ProductsEntity.dart';

class FavoriteProvider extends ChangeNotifier {
  // List<DataProductEntity> _favorites = [];
  //
  //
  //
  // List<DataProductEntity> get favorites => _favorites;
  //
  // void toggleFavorite(DataProductEntity product) {
  //   if (isFavorite(product)) {
  //     _favorites.removeWhere((item) => item.id == product.id);
  //   } else {
  //     _favorites.add(product);
  //   }
  //   notifyListeners();
  // }
  //
  // bool isFavorite(DataProductEntity product) {
  //   return _favorites.any((item) => item.id == product.id);
  // }

}

class AuthUserProvider extends ChangeNotifier {
  UserLoginEntity? user;
  List<DataProductEntity> _favorites = [];
  List<DataProductEntity> get favorites => _favorites;
  void updateUser(UserLoginEntity newUser) {
    user = newUser;
    notifyListeners();
  }
  void toggleFavorite(DataProductEntity product) {
    if (isFavorite(product)) {
      _favorites.removeWhere((item) => item.id == product.id);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(DataProductEntity product) {
    return _favorites.any((item) => item.id == product.id);
  }
}


// class AuthUserProvider extends ChangeNotifier {
//   MyUser? currentUser;
//
//   void updateUser(MyUser newUser) {
//     currentUser = newUser;
//     notifyListeners();
//   }
// }