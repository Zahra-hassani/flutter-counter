import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return MaterialPageRoute(builder: (context) => LoginScreen());
        }

        final uri = Uri.parse(settings.name ?? '');
        if (uri.pathSegments.length == 2 && uri.pathSegments.first == "home") {
          final _userName = uri.pathSegments.last;
          return MaterialPageRoute(
            builder: (context) => HomePage(userName: _userName),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100), // Add padding for top space
              Center(
                child: Text(
                  "Login Form",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                // Clearing composing range when the text changes prevents
                // the TextInputClient assertion errors
                onChanged: (text) {
                  _nameController.value = _nameController.value.copyWith(
                    composing: TextRange.empty,
                  );
                },
                decoration: InputDecoration(
                  labelText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final inputName = _nameController.text.trim();

                  if (inputName.isNotEmpty) {
                    Navigator.pushNamed(context, '/home/$inputName');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter a name first!"),
                      ),
                    );
                  }
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final userName;
  HomePage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: ListView(
        children: [
          Image.network(
            "https://cdn.dribbble.com/userupload/37418793/file/original-21e87cb2e40473e2a3e0a451970aa601.gif",
          ),
          Center(
            child: Text(
              "Hi, $userName !",
              style: TextStyle(color: Colors.deepPurple, fontSize: 20),
            ),
          ),
          Image.network("https://media.tenor.com/ose5QDT2tRYAAAAM/wave-hi.gif"),
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
