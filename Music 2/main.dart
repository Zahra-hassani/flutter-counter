import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MusicApp(),
    ),
  );
}

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade200,
    primary: Colors.pink,
    secondary: Colors.grey.shade300,
    inversePrimary: Colors.pink.shade900,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade800,
    primary: Colors.pink,
    secondary: Colors.pink.shade600,
    inversePrimary: Colors.pink.shade600,
  ),
);

class ThemeProvider extends ChangeNotifier {
  // create and encapsulate the theme data
  ThemeData _themeData = lightMode;

  // use getter for theme data
  ThemeData get themeData => _themeData;

  // access the current mode
  bool get isDarkMode => _themeData == darkMode;

  // setter
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

// model of music
class Song{
  final int id;
  final String title;
  final String singer;
  final String imageUrl;
  final String audioUrl;
  Song(this.id, this.title, this.singer, this.imageUrl, this.audioUrl);
}

// list of songs
List<Song> songs = [
  Song(1, "Yaad sajan", "Rahat fateh ali khan & Aryana Sayeed", "https://i.ytimg.com/vi/6qPxgomMapQ/maxresdefault.jpg", "https://music.apple.com/tm/album/yaad-sajan-single/6789856680"),
  Song(2, "Majboor", "Shehyar Rehan & Zoha Waseem", "https://i.ytimg.com/vi/QHC79Amk-W8/maxresdefault.jpg", "https://lyricsmint.com/sheheryar-rehan/majboor-zoha-waseem"),
];

class MusicApp extends StatelessWidget {
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
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playlist", style: GoogleFonts.pacifico(fontSize: 24)),
      ),
      body: GridView.builder(
        itemCount: songs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5
        ),
        itemBuilder: (context, index){
          return Card(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)
                  ),
                  child: Image.network(songs[index].imageUrl, height: 88, fit: BoxFit.cover)
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(songs[index].title, style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w800
                      )),
                      Text(songs[index].singer, style: GoogleFonts.ubuntu(
                        fontSize: 14, color: Colors.grey
                      ))
                    ]
                  )
                )
              ]
            )
          );
        }
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 130),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).brightness == Brightness.dark
        ? Colors
              .black // Custom text color for dark mode
        : Colors.white;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: GoogleFonts.inter(fontSize: 24)),
      ),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Dark mode",
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w200,
                      color: textColor,
                    ),
                  ),
                  CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(
                      context,
                      listen: false,
                    ).isDarkMode,
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
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 130),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
