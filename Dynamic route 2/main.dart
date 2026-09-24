import 'package:flutter/material.dart';

void main() {
  runApp(AuthApp());
}

class AuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return MaterialPageRoute(builder: (context) => LoginScreen());
        }

        final uri = Uri.parse(settings.name ?? '');
        if (uri.pathSegments.length == 2 && uri.pathSegments.first == "home") {
          final userName = uri.pathSegments.last;

          return MaterialPageRoute(
            builder: (context) => HomeScreen(username: userName),
          );
        }

        return MaterialPageRoute(builder: (context) => NotFoundScreen());
      },
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Login Form",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            TextField(
              controller: _nameController,
              onChanged: (text) {
                _nameController.value = _nameController.value.copyWith(
                  composing: TextRange.empty,
                );
              },
              decoration: InputDecoration(
                labelText: "Enter your Name",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final inputName = _nameController.text.trim();

                if (inputName.isNotEmpty) {
                  Navigator.pushNamed(context, "/home/$inputName");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter your name first"),
                    ),
                  );
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String username;
  HomeScreen({required this.username});

  String get greetMessage {
    final int hour = DateTime.now().hour;
    if (hour >= 12 && hour <= 18) {
      return "Good afternoon!";
    } else if (hour < 12) {
      return "Good morning!";
    } else {
      return "Good evening!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [Icon(Icons.account_circle), Icon(Icons.settings)],
      ),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Hi $username, $greetMessage",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 40),
          Center(
            child: Image.network(
              "https://images.samsung.com/is/image/samsung/assets/ca/app/gaming-hub/gaminghub_section_04_mo_720x670.jpg?\$720_N_JPG\$",
            ),
          ),
        ],
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("404", style: TextStyle(fontSize: 34)),
            Text("The page you're requested is not found."),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
