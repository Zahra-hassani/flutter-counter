import 'package:flutter/cupertino.dart'; // Added for CupertinoSwitch
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const BookApp(),
    ),
  );
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;

  bool _isProgrammaticScroll = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isProgrammaticScroll) return;
    if (!_scrollController.hasClients) return;

    double currentOffset = _scrollController.offset;
    double maxScroll = _scrollController.position.maxScrollExtent;

    if (maxScroll <= 0) return;

    double middleThreshold = maxScroll * 0.13;
    double endThreshold = maxScroll * 0.46;

    int targetIndex = 0;

    if (currentOffset >= endThreshold) {
      targetIndex = 2;
    } else if (currentOffset >= middleThreshold) {
      targetIndex = 1;
    } else {
      targetIndex = 0;
    }

    if (_tabController.index != targetIndex) {
      setState(() {
        _tabController.animateTo(targetIndex);
      });
    }
  }

  void _onTabTapped(int index) async {
    _isProgrammaticScroll = true;
    double maxScroll = _scrollController.position.maxScrollExtent;

    double targetOffset = 0.0;
    if (index == 1) targetOffset = maxScroll * 0.43;
    if (index == 2) targetOffset = maxScroll * 0.85;

    await _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    _isProgrammaticScroll = false;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return DefaultTabController(
      initialIndex: currentIndex,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Buy Books in a minute with",
                style: TextStyle(
                  fontSize: 15,
                  color: isDark ? Colors.white : Colors.black38,
                ),
              ),
              Text(
                "Bookfly",
                style: GoogleFonts.pacifico(
                  fontSize: 19,
                  color: Colors.purple,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: const [Icon(Icons.search)],
          bottom: TabBar(
            labelColor: Colors.purple,
            indicatorColor: Colors.purple,
            controller: _tabController,
            onTap: _onTabTapped,
            tabs: const [
              Tab(text: "Novels"),
              Tab(text: "History"),
              Tab(text: "Science"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            currentIndex = 0;
            _tabController.animateTo(currentIndex);
          },
          child: const Icon(Icons.arrow_upward),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                bookCategory("Novels", 0),
                bookList(Books.novels),
                bookCategory("History", 1),
                bookList(Books.history),
                bookCategory("Science", 2),
                bookList(Books.science),
              ],
            ),
          ),
        ),
        drawer: const DrawerSection(),
      ),
    );
  }
}

class Book {
  final String name;
  final double price;
  final String description;
  final String image;
  Book({
    required this.name,
    required this.price,
    required this.description,
    required this.image,
  });
}

class Books {
  static List<Book> novels = [
    Book(
      name: "The Things We Never Say",
      price: 14.99,
      description: "The Things We Never Say is a 2026 novel by American author Elizabeth Strout...",
      image: "https://media-amazon.com",
    ),
    Book(
      name: "The End of Everything",
      price: 12.99,
      description: "The End of Everything is a 2026 post-apocalyptic novel by M. John Harrison...",
      image: "https://media-amazon.com",
    ),
  ];

  static List<Book> history = [
    Book(
      name: "Castles",
      price: 15.00,
      description: "For thousands of years humans have built castles to protect themselves...",
      image: "https://media-amazon.com",
    ),
  ];

  static List<Book> science = [
    Book(
      name: "Every Last Fish",
      price: 15.00,
      description: "Cold-blooded, slippery, wet and strange...",
      image: "https://media-amazon.com",
    ),
  ];
}

Widget bookCategory(String title, int index) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(title, style: const TextStyle(fontSize: 24)),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("see more", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    ],
  );
}

Widget bookCard(Book book) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: SizedBox(
      height: 200,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: Image.network(book.image)),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    book.name,
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    book.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${book.price} /\$",
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_right_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget bookList(List<Book> books) {
  return Column(
    children: [
      ...books.map(
        (book) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: bookCard(book),
        ),
      ),
      const Divider(),
    ],
  );
}

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.purple,
    secondary: Colors.grey.shade100,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade800,
    primary: Colors.purple,
    secondary: Colors.grey.shade100,
  ),
);

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
  }
}

class DrawerSection extends StatelessWidget {
  const DrawerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(height: 100, width: double.infinity, color: Colors.purple),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.purple),
            title: const Text("Home"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.purple),
            title: const Text("Settings"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Buy Books in a minute with",
              style: TextStyle(fontSize: 15, color: Colors.black38),
            ),
            Text(
              "Bookfly",
              style: GoogleFonts.pacifico(
                fontSize: 19,
                color: Colors.purple,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        actions: const [Icon(Icons.search)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Dark Mode", style: TextStyle(fontSize: 24)),
                  CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context).isDarkMode,
                    onChanged: (value) => Provider.of<ThemeProvider>(
                      context,
                      listen: false,
                    ).toggleTheme(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerSection(),
    );
  }
}
