import 'package:flutter/material.dart';

void main() {
  runApp(ProductApp());
}

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange.shade700,
          foregroundColor: Colors.white,
        ),
      ),
      title: "All the Products",
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '');

        if (uri.path == '/products') {
          final search = uri.queryParameters['search'] ?? '';

          return MaterialPageRoute(
            builder: (context) => Products(search: search),
            settings: settings,
          );
        }

        return MaterialPageRoute(builder: (context) => HomeScreen());
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NiceStore")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Welcome to our store", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/products?search=e');
              },
              child: const Text("Go to Products page"),
            ),
          ],
        ),
      ),
    );
  }
}

class Products extends StatelessWidget {
  final String search;
  Products({super.key, required this.search});
  final List<List<dynamic>> products = [
    [1, 'Apple'],
    [2, 'Pear'],
    [3, 'Melon'],
    [4, 'Peach'],
    [5, 'Orange'],
    [6, 'Avokado'],
    [7, 'Kiwi'],
    [8, 'Mango'],
    [9, 'Strawberry'],
    [10, 'Water melon'],
    [11, 'Pineapple'],
    [12, 'Apricot'],
    [13, 'Lemon'],
  ];
  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((x) {
      if (search.isEmpty) return true;
      return x[1].toLowerCase().contains(search.toLowerCase());
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          search.isEmpty ? 'All Products' : 'Results for $search',
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  filteredProducts[index][1],
                  style: TextStyle(fontSize: 25, color: Colors.orange.shade800),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
