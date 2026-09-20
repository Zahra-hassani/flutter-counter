import 'package:flutter/material.dart';

void main() {
  runApp(FulTour());
}

class FulTour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.teal, foregroundColor: Colors.white)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<dynamic> _AllCities = [
    [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4KY6DUHDSQdfP86Rr70z86nWnrdpp9UaoGRa1XvbCw1_z1AKgbDloxaXm&s=10",
      "Dubai"
    ],
    [
      "https://static.independent.co.uk/2025/06/11/16/54/iStock-1454217037.jpeg",
      "New York"
    ],
    [
      "https://images.squarespace-cdn.com/content/v1/5f9af6090c0a7348fa94da7e/1604512704269-4CNHWHKSBD66SJ84PMFT/DJI_0565-13-1200x852.jpg",
      "Sydney"
    ],
    [
      "https://images.ctfassets.net/bth3mlrehms2/7QDq8LVoq8N8o9o4i7YVl/b0b34b1aafb903c3a6f5e3c5f7d3782d/Big_Ben_London_EnglandTCG.jpg?w=1080&q=60&fm=webp",
      "London"
    ],
    [
      "https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/04/14/17/istock-958597180.jpg",
      "Paris"
    ],
    [
      "https://www.maladeaventuras.com/wp-content/uploads/2025/01/categoria-mexico.jpg",
      "Mexico"
    ],
    [
      "https://www.fodors.com/assets/destinations/54492/colosseum-ancient-rome-rome-italy-europe.jpg",
      "Rome"
    ],
    [
      "https://skift.com/wp-content/uploads/2022/06/GettyImages-1208049833-scaled-e1654782377122.jpg",
      "Agra"
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("FulTour",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 26)),
          leading: Icon(Icons.more_vert)),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          itemCount: _AllCities.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 7),
          itemBuilder: (context, index) {
            return Card(
                child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    child: Image.network(_AllCities[index][0],
                        fit: BoxFit.cover)),
                Center(
                    child: Text(_AllCities[index][1],
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 24,
                            fontWeight: FontWeight.w700))),
              ],
            ));
          }),
    );
  }
}

