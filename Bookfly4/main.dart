import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
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
    // If the scroll was triggered by clicking a tab, ignore it temporarily
    if (_isProgrammaticScroll) return;

    if (!_scrollController.hasClients) return;

    double currentOffset = _scrollController.offset;
    double maxScroll = _scrollController.position.maxScrollExtent;

    // Guard against edge case where list is too short to scroll
    if (maxScroll <= 0) return;

    // Calculate dividing lines based on fractions of total scroll height
    double middleThreshold = maxScroll * 0.13;
    double endThreshold = maxScroll * 0.46;

    int targetIndex = 0;

    if (currentOffset >= endThreshold) {
      targetIndex = 2; // Near the end -> Third Tab
    } else if (currentOffset >= middleThreshold) {
      targetIndex = 1; // In the middle -> Second Tab
    } else {
      targetIndex = 0; // Near the top -> First Tab
    }

    // Only update the tab index if it actually changed to avoid repetitive rebuilds
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
    if (index == 1) targetOffset = maxScroll * 0.43; // Scroll to exact middle
    if (index == 2) targetOffset = maxScroll * 0.85;
    // Scroll to the absolute bottom

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
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.search)],
          bottom: TabBar(
            labelColor: Colors.purple,
            indicatorColor: Colors.purple,
            controller: _tabController,
            onTap: _onTabTapped,
            tabs: [
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
          child: Icon(Icons.arrow_upward),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 12, bottom: 12),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                BookCategory("Novels", 0),
                BookList(Books.novels),
                BookCategory("History", 1),
                BookList(Books.history),
                BookCategory("Science", 2),
                BookList(Books.science),
              ],
            ),
          ),
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
      description: "The Things We Never Say is a 2026 novel by American author Elizabeth Strout. It marks a departure from the interconnected settings and recurring characters of her previous works, instead introducing a new protagonist in a standalone narrative. The novel was published on May 5, 2026, by Random House.",
      image: "https://m.media-amazon.com/images/I/81ZNUoUfNhL._UF1000,1000_QL80_FMwebp_.jpg",
    ),
    Book(
      name: "The End of Everything",
      price: 12.99,
      description: "The End of Everything is a 2026 post-apocalyptic novel by M. John Harrison, published in the UK by Serpent's Tail. Harrison's 13th novel, it was shortlisted for the 2026 Booker Prize.",
      image: "https://m.media-amazon.com/images/I/919WtJ62koL._AC_UF1000,1000_QL80_FMwebp_.jpg",
    ),
    Book(
      name: "The Disappearers",
      price: 13.99,
      description: "The Disappearers is a 2026 novel by Jamaican writer Marlon James, published in the UK by Hamish Hamilton and in the United States by Riverhead Books. It is his sixth novel overall and the first since 2015's A Brief History of Seven Killings to be set in Jamaica.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIVo1gG6LeuoIOsyKzgZZfuRTVpH8BXML_sWlYD-nABQ0RZqj3cY_u2kvN&s=10",
    ),
  ];

  static List<Book> history = [
    Book(
      name: "Castles",
      price: 15.00,
      description: "For thousands of years humans have built castles to protect themselves. From the great citadel of Troy to Viking ring forts; from the looming menace of the Tower of London to the mazes of Himeji in Japan; from the Gothic spires of Neuschwanstein to the concrete bunkers of the Maginot Line, castles have been the tool of conquest and the last line of defence. They have inspired hope and fear, majesty and terror.",
      image: "https://m.media-amazon.com/images/I/81uRo33LYZL._AC_UF894,1000_QL80_FMwebp_.jpg",
    ),
    Book(
      name: "Seven Sisters",
      price: 28.48,
      description: "Meticulously researched and animated by the sisters’ own diaries and the almost daily letters traversing the continent, Seven Sisters reveals the drama, tragedy and comedy of these exceptional yet all too human lives. It is a vivid portrait of a brilliant world collapsing in a fearful time.",
      image: "https://m.media-amazon.com/images/I/71TiwO1MX1L._AC_UF1000,1000_QL80_FMwebp_.jpg",
    ),
    Book(
      name: "Smart",
      price: 45.00,
      description: "Intelligence, then, is an idea that infuses our world, and one that we think matters. This hasn't always been the case. Like all ideas, intelligence has a history.",
      image: "https://m.media-amazon.com/images/I/71PuE7nra9L._AC_UF894,1000_QL80_FMwebp_.jpg",
    ),
  ];

  static List<Book> science = [
    Book(
      name: "Every Last Fish",
      price: 15.00,
      description: "Cold-blooded, slippery, wet and strange: fish can be hard to think of as fellow animals and easier to consider as food. But what do we know of these creatures on our plates, and what do we know of how they got there?",
      image: "https://m.media-amazon.com/images/I/81IC3s8oJ3L._AC_UF894,1000_QL80_FMwebp_.jpg",
    ),
    Book(
      name: "The Equality of All Things",
      price: 16.34,
      description: "With clarity and lightness, acclaimed physicist Carlo Rovelli takes us on a journey of enlightenment, to the speculative frontiers of modern physics and the boundaries of thought. There is no fear in testing their limits, he suggests – not least because there may be no final ground to reach.",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRic1zSV8AGqVl0TY16M52xQKpHN436tRERB1xiRpT41naxRcUc",
    ),
    Book(
      name: "Hawking",
      price: 35.00,
      description: "A brilliant theoretical physicist, Hawking lived one of the most extraordinary lives of the past century. And yet none of this should have been possible. Diagnosed with ALS at age twenty-one, he was given only a few years to live—and spent the next fifty-five showing what can be achieved despite near-hopeless odds.",
      image: "https://m.media-amazon.com/images/I/71cP25Ss73L._AC_UF1000,1000_QL80_FMwebp_.jpg",
    ),
  ];
}

Widget BookCategory(String title, int index) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(title, style: TextStyle(fontSize: 24)),
          ),
          TextButton(
            onPressed: () {},
            child: Text("see more", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    ],
  );
}

Widget BookCard(Book book) {
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
              padding: EdgeInsets.symmetric(horizontal: 14),
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
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_right_outlined),
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

Widget BookList(List<Book> books) {
  return Column(
    spacing: 10,
    children: [...books.map((book) => BookCard(book)), Divider()],
  );
}
