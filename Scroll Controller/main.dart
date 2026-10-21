import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MobileApp()));
}

class App {
  String title;
  String desc;
  String img;
  App(this.title, this.desc, this.img);
}

class MobileApp extends StatefulWidget {
  @override
  State<MobileApp> createState() => _AppState();
}

class _AppState extends State<MobileApp> {
  List<App> _apps = [
    App(
      "General List",
      "You have 15 things to do",
      "https://thumbs.dreamstime.com/b/animated-blue-navy-clipboard-checklist-clipart-png-illustration-web-icon-to-do-list-checklist-cupboard-icon-sign-png-266935116.jpg",
    ),
    App(
      "Wish List",
      "You have 12 wishes",
      "https://png.pngtree.com/png-clipart/20230927/original/pngtree-gift-box-cartoon-cute-png-image_13000837.png",
    ),
    App(
      "Go to List",
      "You have 8 places to go",
      "https://png.pngtree.com/png-clipart/20241215/original/pngtree-globe-icon-illustrations-png-image_17883906.png",
    ),
    App(
      "Shopping List",
      "You have 23 items to buy",
      "https://cdn-icons-png.flaticon.com/256/5993/5993337.png",
    ),
  ];

  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "To Do List",
          style: TextStyle(color: Colors.blue, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _apps.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(
                _apps[index].img,
                fit: BoxFit.fitHeight,
                width: MediaQuery.sizeOf(context).width * 0.3,
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    _apps[index].title,
                    style: TextStyle(color: Colors.blue, fontSize: 22),
                  ),
                  Text(
                    _apps[index].desc,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text("View", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_scrollController.hasClients && _scrollController.offset > 100) {
            _scrollController.animateTo(
              0,
              duration: Duration(milliseconds: 80),
              curve: Curves.easeIn,
            );
          }
        },
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}
