import 'package:flutter/material.dart';

void main() {
  runApp(const GreenStore());
}

class GreenStore extends StatefulWidget {
  const GreenStore({super.key});
  @override
  State<GreenStore> createState() => _App();
}

class _App extends State<GreenStore> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Pages(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[900],
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

// Class of all pages
class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  int _index = 0;
  void changeIndex(int index) {
    setState(() {
      _index = index;
    });
  }

  final List<Widget> _pages = const [Home(), Profile(), Info(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GreenStore", style: TextStyle(fontSize: 30)),
        leading: const Icon(Icons.menu),
      ),
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "Info",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        onTap: changeIndex,
        selectedFontSize: 16,
        unselectedFontSize: 13,
        selectedItemColor: Colors.lightGreen[900],
        unselectedItemColor: Colors.green[900],
        backgroundColor: Colors.white,
        currentIndex: _index,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Center(
            child: Text(
              "Welcome to home page",
              style: TextStyle(color: Colors.green[900]),
            ),
          ),
          Image.network(
            "https://static.vecteezy.com/system/resources/thumbnails/076/472/614/small/purple-flower-and-green-grass-with-dew-drop-in-spring-garden-background-nature-beauty-in-sunlight-fresh-morning-concept-for-greeting-card-photo.jpeg",
            width: double.infinity,
          ),
          Image.network(
            "https://thumbs.dreamstime.com/b/fresh-spring-field-bright-green-grass-under-clear-blue-sky-captured-super-high-resolution-premium-quality-364340154.jpg",
            width: double.infinity,
          ),
          Image.network(
            "https://wallpaperaccess.com/full/1644321.jpg",
            width: double.infinity,
          ),
          Image.network(
            "https://images.unsplash.com/photo-1543862475-eb136770ae9b?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z3Jhc3MlMjBmbG93ZXJ8ZW58MHx8MHx8fDA%3D",
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://img.stablecog.com/insecure/1920w/aHR0cHM6Ly9iLnN0YWJsZWNvZy5jb20vNzYxYjVhYjUtNjBkZi00ZTY1LWE1NTItMzc0MTQ3Yzc3MzlhLmpwZWc.webp",
                  ),
                ),
              ),
            ),
            const Center(
              child: Text("Sara Sarwari", style: TextStyle(fontSize: 21)),
            ),
            Center(
              child: Container(
                child: Row(
                  children: <Widget>[
                    Chip(label: Text("Messages"), avatar: Icon(Icons.email)),
                    Chip(label: Text("Posts"), avatar: Icon(Icons.send)),
                    Chip(label: Text("More"), avatar: Icon(Icons.more_vert)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Center(child: Text('Info page', style: TextStyle(fontSize: 20))),
        Text(
          "Green Store is a neighborhood grocery shop committed to bringing fresh, sustainable, and wholesome food options straight to your dinner table. Specializing in locally sourced organic produce, bulk zero-waste grains, and eco-friendly pantry staples, the market makes it easy for shoppers to eat healthy while reducing plastic waste and their environmental footprint. By prioritizing fair-trade partnerships and minimal packaging, Green Store bridges the gap between local farming and urban communities. It is a welcoming marketplace where conscious eating meets everyday convenience, proving that nourishment for your body can also mean care and respect for our planet.",
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Settings page', style: TextStyle(fontSize: 20)),
    );
  }
}
