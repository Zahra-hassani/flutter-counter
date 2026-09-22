import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo[900],
          foregroundColor: Colors.white,
        ),
      ),
      home: WelcomePages(),
    );
  }
}

class WelcomePages extends StatelessWidget {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        children: [Page1(), Page2(), Page3(), Page4(), Page5()],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[700],
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                "https://png.pngtree.com/png-clipart/20250312/original/pngtree-welcome-text-png-image_20645057.png",
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Step into your space",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[700],
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                "https://img.icons8.com/external-flaticons-flat-flat-icons/1200/external-user-friendly-no-code-flaticons-flat-flat-icons.jpg",
              ),
            ),
            Text(
              "Easy and simple to use",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[700],
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                "https://png.pngtree.com/png-vector/20250518/ourmid/pngtree-blue-shield-icon-with-checkmark-symbolizing-security-protection-and-verified-approval-png-image_16317361.png",
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Safe and Secure",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[700],
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                "https://png.pngtree.com/png-vector/20241001/ourmid/pngtree-speed-icon-design-vector-faster-logo-png-image_13992111.png",
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "Quick Performance",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[700],
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                "https://png.pngtree.com/png-clipart/20250417/original/pngtree-golden-elegant-thank-you-typography-png-image_20753833.png",
                fit: BoxFit.contain,
              ),
            ),
            Text(
              "For your choice",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              child: Text(
                "Get started",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<dynamic> _menu = [
    [
      "https://thumbs.dreamstime.com/b/conceptual-hand-writing-showing-top-stories-business-photo-showcasing-most-read-important-news-information-messages-conceptual-131751440.jpg",
      "Top Stories",
    ],
    ["https://cdn-icons-png.flaticon.com/512/1077/1077035.png", "My favorites"],
    [
      "https://media.istockphoto.com/id/1266703967/vector/about-us-concept-illustration.jpg?s=612x612&w=0&k=20&c=e5BxGf3v059niZkFVL3S5osH9Hlxc-YlmJT4oJW4roU=",
      "About us",
    ],
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3e_Ch-S0bSTQxMQ4STGD2YfBuNZlciQIyIHXr-9G66g&s=10",
      "More apps",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "mora",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        itemCount: _menu.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 7,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(_menu[index][0]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _menu[index][1],
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
