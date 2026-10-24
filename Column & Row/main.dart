import 'package:flutter/material.dart';

void main() {
  runApp(Story());
}

class Story extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5LegswdCViAFn7Ja9oZH0uCxhTQtyuPemhEz_QSCMKPVog-sJ-QvP6Bd5&s=10")
              ),
              title: Text("Mahri Mohammadi"),
              subtitle: Text("about 12hrs ago"),
              trailing: IconButton(
                onPressed: (){},
                icon: Icon(Icons.more_vert )
              )
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                    Image.network("https://media.licdn.com/dms/image/v2/D4D12AQG5Qc-mKJn1aQ/article-cover_image-shrink_600_2000/article-cover_image-shrink_600_2000/0/1706213599958?e=2147483647&v=beta&t=CLcThjx_TQxlh39CLMZX8FuVo7IG6OSlH0xa6LnXFwo"),
                  Container(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Chip(
                          avatar: Icon(Icons.share),
                          label: Text("Share")
                        ),
                        Chip(
                          avatar: Icon(Icons.comment),
                          label: Text("Comment")
                        ),
                        Chip(
                          avatar: Icon(Icons.thumb_up),
                          label: Text("Like")
                        ),
                      ]
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    ])));
  }
}
