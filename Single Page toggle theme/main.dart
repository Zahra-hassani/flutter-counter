import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: SeedApp(),
    ),
  );
}

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.blue[800]!,
    primary: Colors.grey.shade100,
    secondary: Colors.grey.shade300,
    inversePrimary: Colors.grey[700]!,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.blue[800]!,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey[100]!,
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
      notifyListeners();
    } else {
      _themeData = lightMode;
      notifyListeners();
    }
  }
}

class SeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          "Asora",
          style: GoogleFonts.kumarOne(fontSize: 24, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Provider.of<ThemeProvider>(context).isDarkMode
                ? Icon(Icons.dark_mode, color: Colors.white)
                : Icon(Icons.light_mode, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 150,
          width: MediaQuery.sizeOf(context).width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue.shade300, Colors.blue],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(22),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Flutter App",
                    style: GoogleFonts.lobsterTwo(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "dark & light theme in flutter app",
                    style: GoogleFonts.lobsterTwo(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
