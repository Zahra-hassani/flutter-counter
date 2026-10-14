import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  List<Widget> _bookScreens = [
    // novels
    GridView.builder(
      itemCount: Books.novel.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 7,
      ),
      itemBuilder: (context, index) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    "${Books.novel[index].image}",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "${Books.novel[index].name}",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
    // history
    GridView.builder(
      itemCount: Books.history.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 7,
      ),
      itemBuilder: (context, index) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    "${Books.history[index].image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "${Books.history[index].name}",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
    // science
    GridView.builder(
      itemCount: Books.science.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6,
        mainAxisSpacing: 7,
      ),
      itemBuilder: (context, index) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    "${Books.science[index].image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Text(
                  "${Books.science[index].name}",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                "Buy books in a minute with",
                style: TextStyle(fontSize: 12),
              ),
              Text(
                "BookFly",
                style: GoogleFonts.pacifico(
                  fontSize: 16,
                  color: Colors.purple,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          leading: Icon(Icons.menu),
          backgroundColor: Colors.white,
          actions: [Icon(Icons.search)],
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            labelColor: Colors.purple,
            indicatorColor: Colors.purple,
            unselectedLabelColor: Colors.purple.shade300,
            tabs: [
              Tab(text: "Novels"),
              Tab(text: "History"),
              Tab(text: "Science"),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: IndexedStack(index: currentIndex, children: _bookScreens),
        ),
      ),
    );
  }
}

class Book {
  final String name;
  final double price;
  final String description;
  final String image;
  Book(this.name, this.price, this.description, this.image);
}

class Books {
  static List<Book> novel = [
    Book(
      "The Almond Garden of Kabul",
      14.99,
      "...",
      "https://m.media-amazon.com/images/I/81dv2RDnDJL._AC_UF894,1000_QL80_FMwebp_.jpg",
    ),
  ];

  static List<Book> history = [
    Book(
      "Shattered Lands",
      30.32,
      "...",
      "https://m.media-amazon.com/images/I/81i1DAIf+pL._AC_UF1000,1000_QL80_FMwebp_.jpg",
    ),
  ];

  static List<Book> science = [
    Book(
      "How to change A Memory",
      29.95,
      "...",
      "https://pup-assets.imgix.net/onix/images/9780691266688.jpg?w=410&auto=format",
    ),
  ];
}
