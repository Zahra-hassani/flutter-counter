import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text(
          "facebook",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w800,
            fontSize: 35,
          ),
        ),
        actions: const [Icon(Icons.add_box), Icon(Icons.search)],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.home)),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.videocam),
              ),
              Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.group)),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.business),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.notifications),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                _buildStory(),
                _buildStory(),
                _buildStory(),
                _buildStory(),
                _buildStory(),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return const AllPosts();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStory() {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.black, width: 2.0),
        borderRadius: BorderRadius.circular(50),
      ),
      child: const CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRSuANVaJAJMff242QYQ3tOhVynRqOGL90TivhcAZZSJr_Xc9AqBipIieY&s=10",
        ),
      ),
    );
  }
}

class AllPosts extends StatelessWidget {
  const AllPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        // 1. Apply decoration to the surrounding container
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey, // Border color
              width: 2.0, // Border thickness
            ),
          ),
        ),
        child: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  "https://t3.ftcdn.net/jpg/04/64/99/60/360_F_464996021_MjaTZIOPgFFScgFp6rgMfHzz3pGvmiGQ.jpg",
                ),
              ),
              title: Text("Leaf Support"),
              subtitle: Text(
                "2 days ago",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ),
            Image.network(
              "https://png.pngtree.com/background/20250105/original/pngtree-beautiful-fresh-green-grass-spring-summer-landscape-natural-background-picture-image_15519097.jpg",
              height: 450,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12.0, bottom: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.favorite_border),
                  Icon(Icons.comment),
                  Icon(Icons.share),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
