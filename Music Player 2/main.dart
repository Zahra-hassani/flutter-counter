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
class Song {
  final int id;
  final String title;
  final String singer;
  final String imageUrl;
  final String audioUrl;
  Song(this.id, this.title, this.singer, this.imageUrl, this.audioUrl);
}

// list of songs
List<Song> songs = [
  Song(
    1,
    "Sahel Aramesh",
    "Aron Afshar",
    "https://is1-ssl.mzstatic.com/image/thumb/Music125/v4/fa/97/c4/fa97c482-ad90-9c00-5634-cb6c884002f7/cover.jpg/375x375bb.webp",
    "https://dl.rozmusic.com/Music/1399/11/10/Aron%20Afshar%20-%20Sahel%20Aramesh.mp3",
  ),
  Song(
    2,
    "Shabe Royaei",
    "Aron Afshar",
    "https://i.ytimg.com/vi/PgUHVsIMyrM/maxresdefault.jpg",
    "https://dl.rozmusic.com/Music/1398/07/16/Aron%20Afshar%20-%20Shabe%20Royaei.mp3",
  ),
  Song(
    3,
    "Ariyayi",
    "Aron Afshar & Jonibek Murodov",
    "https://birseda.net/wp-content/uploads/2026/07/Aron-Afshar-Ariyayi-Ft-Jonibek-Murodov.jpg",
    "https://dl.rozmusic.com/Music/1405/04/22/Aron%20Afshar%20%26%20Jonibeik%20Murdov%20-%20Ariyayi.mp3",
  ),
  Song(
    4,
    "Farsi Zabanan",
    "Aron Afshar",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPJueU_7yJ3P5NpeXlpFLkxywtxu99HarJUXpMGgFXotOUEOHyiX3haCtE&s=10",
    "https://dls.musics-fa.com/song/alibz/2026/09/Aron%20Afshar%20-%20Farsi%20Zabanan%20Musics-Fa.mp3",
  ),
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
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(12),
            child: Container(
               height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Colors.grey.shade400,
                    offset: Offset(2, 3),
                    spreadRadius: 2,
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      songs[index].imageUrl,
                      height: 80,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          songs[index].title,
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          songs[index].singer,
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
              child: Padding(
                padding: EdgeInsets.all(12),
                child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Dark mode",
                    style: GoogleFonts.ubuntu(
                      fontWeight: FontWeight.w200,
                      color: Theme.of(context).colorScheme.primary,
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
              )),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 130,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.music_note),
                    Text("Music Player", style: GoogleFonts.pacifico(fontSize: 22) )
                  ]
              )
            ),
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

