import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:online_store/StoreProvider.dart';
import 'package:online_store/FavoriteList.dart';
import 'package:online_store/Model.dart';
import 'package:online_store/MyCart.dart';
import 'package:online_store/Service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreenBody(),
    Favoritelist(),
    Mycart(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffF17547),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favorite',
            activeIcon: Icon(Icons.favorite_border_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),

        ],
      ),
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late Future<List<Product>> _productsFuture;
  final ApiService _apiService = ApiService();
  String _selectedCategory = 'Phone';


  @override
  void initState() {
    super.initState();
    fetchProductsByCategory(_selectedCategory);
  }

  void fetchProductsByCategory(String category){
    setState(() {
      String apiCategory;
      switch(category){
        case 'Phone':
          apiCategory = 'smartphones';
          break;
        case 'Watch':
          apiCategory = 'mens-watches';
          break;
        case 'Apparel':
          apiCategory = 'mens-shirts';
          break;
        case 'Laptop':
          apiCategory = 'laptops';
          break;
        case 'Bag':
          apiCategory = 'womens-bags';
          break;
        default:
          apiCategory = 'smartphones';
          return ;
      }
      _selectedCategory = category;
      _productsFuture = getProductsByCategory(apiCategory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello 👋',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Let's start shopping!",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () => fetchProductsByCategory('Phone'),
                    child: CategoryIcon(
                      icon: Icons.phone_android,
                      text: 'Phone',
                      isSelected: _selectedCategory=='Phone',
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () => fetchProductsByCategory('Watch'),
                    child: CategoryIcon(
                      icon: Icons.watch,
                      text: 'Watch',
                      isSelected: _selectedCategory=='Watch',
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                      onTap: () => fetchProductsByCategory('Apparel'),
                    child: CategoryIcon(
                      icon: Icons.checkroom,
                      text: 'Apparel',
                      isSelected: _selectedCategory=='Apparel',
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () => fetchProductsByCategory('Laptop'),
                    child: CategoryIcon(
                      icon: Icons.laptop,
                      text: 'Laptop',
                      isSelected: _selectedCategory=='Laptop',
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () => fetchProductsByCategory('Bag'),
                    child: CategoryIcon(
                      icon: Icons.shopping_bag_outlined,
                      text: 'Bag',
                      isSelected: _selectedCategory=='Bag',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<List<Product>>(
                future: _productsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No products found.'));
                  } else {
                    final products = snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.only(top: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                          product: product,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  const CategoryIcon({
    super.key,
    required this.icon,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFFF17547) : Color(0xFFE7E7E7),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Text(text),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    final isFavorited = storeProvider.isFavorite(product);
    final currentPrice = '\$${product.price.toStringAsFixed(2)}';
    final oldPrice = '\$${(product.price * 1.5).toStringAsFixed(2)}';

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => storeProvider.toggleFavorite(product),
                child: Icon(
                  isFavorited ? Icons.favorite : Icons.favorite_border,
                  color: isFavorited ? Colors.red : Colors.grey,
                  size: 20,
                ),
              ),
              GestureDetector(
                onTap: () {
                   storeProvider.addToCart(product);
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                     content: Text('${product.title} added to cart'),
                     duration: const Duration(seconds: 1),
                   ));
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xffF17547),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: Center(
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            product.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Text(
                currentPrice,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF17547),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                oldPrice,
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}