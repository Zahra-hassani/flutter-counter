import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              title: Text("More Info..."),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu)
                )
              ]
          ),
          body: SingleChildScrollView(
            child: Column(
                children: [
                  Text("New Zealand", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                            "New Zealand is an island country in the southwestern Pacific Ocean, featuring a rich Māori heritage and a population of over 5.3 million people.")
                    ),
                  ),
                  Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr0nmkYF2p4iC_45ncWyNj8mAQw3Xvp9xgk1CBOdnKGw&s=10",
                      height: 300, width: 600),
                  Image.network(
                      "https://www.travelandleisure.com/thmb/k6P4-qJ4loP9DkUDHAu5WxNNiI8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/TAL--new-zealand-MSTGORGCNTRY0524-60b4b6e4ba6249d2afef5c9e35d38ba8.jpg",
                      height: 400, width: 600),
                  Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8pCphR0ZyJSvw9dbogS72TutsdMGkd3SJ1B-o2mfcUQo8k4OA4vR9HlU&s=10",
                      height: 783, width: 391),
                  Image.network(
                      "https://www.newzealand.com/assets/externally-managed-assets/tbd-assets/tbd-folder-10070633/img-1714059025-6034-3150121-tbd-asset__aWxvdmVrZWxseQo_CropResizeWzk0MCw1MzAsOTAsImpwZyJd.jpg",
                      height: 450, width: 600)
                ]
            ),
          )
      ),
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.pink[900],
              foregroundColor: Colors.white
          )
      ),
    );
  }
}
