import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/favorite_provider.dart';
import '../../core/widget/favorite_item.dart';


class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthUserProvider>(context);
    var favoriteProvider = Provider.of<FavoriteProvider>(context);
    var favoriteItems = authProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: favoriteItems.isEmpty
          ? Center(child: Text('No Favorites yet!'))
          : ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          return FavoriteItem(item: favoriteItems[index]);
        },
      ),
    );
  }
}
