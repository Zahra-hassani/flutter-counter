import 'package:flutter/material.dart';

void main() {
  runApp(Telegram());
}

class Telegram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0f2854),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0XFF294a80),
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        body: Channel(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.group_add), label: 'Join'),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Gift',
            ),
          ],
        ),
      ),
    );
  }
}

class Channel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: ListTile(
          leading: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://thumbs.dreamstime.com/b/open-book-glowing-pages-butterflies-emerging-outdoors-wooden-surface-open-book-glowing-pages-butterflies-440980310.jpg",
            ),
          ),
          title: Text(
            "کتابخانه پروانه ها",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            "267 subscribers",
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.all(6),
        child: ClipPath(
          clipper: TelegramSenderClipper(), // Custom clipping applied here
          child: Container(
            color: const Color(0xFF1861de), // Telegram Outgoing Bubble Color
            padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
            constraints: const BoxConstraints(maxWidth: 280),
            child: Column(
              children: [
                Text(
                  "کتابخانه پروانه ها",
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  "در کشور من،",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    "نام هیچ زنی، دریا نیست",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Text(
                  "دریا هزاران سال پیش",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "روسری آبی اش را از سر برداشت،",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "و تمام زن ها کوه شدند...",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  "قوی",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(
                    "مستحکم",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    "و سر سخت...",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                Text("@parwanaha", style: TextStyle(color: Colors.blue)),
                const Divider(color: Colors.grey, thickness: 1),
                Chip(
                  avatar: Icon(Icons.comment),
                  label: Text(
                    "Leave a comment",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TelegramSenderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const double radius = 16.0;

    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius - 4);
    path.quadraticBezierTo(
      size.width,
      size.height - 4,
      size.width - 4,
      size.height - 2,
    );
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width + 4,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - 6,
      size.height,
      size.width - 12,
      size.height - 4,
    );
    path.lineTo(radius, size.height - 4);
    path.quadraticBezierTo(0, size.height - 4, 0, size.height - 4 - radius);
    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
