import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:online_store/StoreProvider.dart';
import 'package:online_store/Model.dart';

class Favoritelist extends StatelessWidget {
  const Favoritelist({super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    final favoriteItems = storeProvider.favoriteProducts;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Favorites',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: favoriteItems.isEmpty 
          ? Center(child: Text("No favorites yet.", style: TextStyle(fontSize: 18, color: Colors.grey)))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  final item = favoriteItems[index];
                  return FavoriteItemCard(
                    product: item,
                    onRemove: () {
                      storeProvider.toggleFavorite(item);
                    },
                  );
                },
              ),
            ),
    );
  }
}

class FavoriteItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  const FavoriteItemCard({
    super.key,
    required this.product,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(product.image, fit: BoxFit.contain),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xffF17547),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
