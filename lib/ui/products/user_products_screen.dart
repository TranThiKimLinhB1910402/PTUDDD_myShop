import 'package:flutter/material.dart';
import 'user_product_list_tile.dart';
import 'products_manager.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productManager = ProductsManager();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          buildAddButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => debugPrint('refresh products'),
        child: buildUserProductListView(productManager),
      ),
    );
  }

  Widget buildUserProductListView(ProductsManager productManager) {
    return ListView.builder(
      itemCount: productManager.itemCount,
      itemBuilder: (ctx, i) => Column(
        children: [
          UserProductListTile(productManager.items[i]),
          const Divider(),
        ],
      ),
    );
  }

  Widget buildAddButton() {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        debugPrint('Go to edit product screen');
      },
    );
  }
}
