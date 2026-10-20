import 'package:flutter/material.dart';

void main() {
  runApp(DevProgram());
}

class Program {
  int id;
  String title;
  String time;
  String desc;
  String imageUrl;

  Program(this.id, this.title, this.time, this.desc, this.imageUrl);
}

class DevProgram extends StatelessWidget {
  final List<Program> cards = [
    Program(
      1,
      "Flutter Development",
      "2:00-3:00 PM",
      "Mobile Application Development & test with different devices",
      "https://api.reliasoftware.com/uploads/what_is_flutter_fcb6c7a4b8.png",
    ),
    Program(
      2,
      "Next.js Tutorials",
      "1:00-2:00 PM",
      "Frontend development to working with server in backend",
      "https://media2.dev.to/dynamic/image/width=1000,height=420,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fmigr0sf87owf06s3dynx.png",
    ),
    // Replaced the broken URL with a valid Python logo URL
    Program(
      3,
      "Python for Beginners",
      "3:00-4:00 PM",
      "Python basics for beginners",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0vE7Zf90uh_dzQ6ag1wghLCIJFodjK3IEnNzxmX-4wbz6VM7P8fKszsCN&s=10",
    ),
    Program(
      4,
      "Express.js",
      "4:00-5:00 PM",
      "Learning Express.js from basics to  dvance",
      "https://img-c.udemycdn.com/course/480x270/6743757_f56a_11.jpg?w=3840&q=75",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Development Programs",
            style: TextStyle(
              color: Colors.deepPurple[800],
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Color(0xFFfc0fc0), Color(0xFFfa003f)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment :MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(
                        cards[index].imageUrl,
                        fit: BoxFit.cover,
                        height: 150,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 150,
                          color: Colors.grey,
                          child: Icon(Icons.broken_image, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cards[index].title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            cards[index].time,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  cards[index].desc,
                                  style: TextStyle(color: Colors.grey[400]),
                                ),
                              ),
                              Icon(Icons.arrow_right, color: Colors.white),
                            ],
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
      ),
    );
  }
}
