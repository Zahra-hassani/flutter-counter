import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(NoteApp());
}

class NoteApp extends StatefulWidget {
  @override
  State<NoteApp> createState ()=> _NoteAppState();
}
class _NoteAppState extends State<NoteApp>{
  final List<Map<String, dynamic>> _todos = [
    {
     "id": 1,
     "title": "Home Chores",
     "description": "Dish washing, swiping th floor & Cooking until 9:30 AM",
     "date": "11/16/2026",
     "done": true
    },
    {
  "id": 2,
  "title": "Practice the Lessons",
  "description": "Doing Homework, reading my lessons and praying until 12:30 AM",
  "date": "11/16/2026",
  "done": true
    },
    {
  "id": 3,
  "title": "Go to Academy",
  "description": "Go and come back to home until 3:00 PM",
  "date": "11/16/2026",
  "done": true
    },
    {
  "id": 4,
  "title": "Meet Sara in Brand Coffeeshop",
  "description": "Meet her at 4:00 PM",
  "date": "11/16/2026",
  "done": false
    },
  ];

  void deleteNote(int id){
    _todos.removeWhere((x)=> x["id"]== id);
    
  }
  
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade900,
          foregroundColor: Colors.white,
          title: Text("Note App",style: GoogleFonts.pacifico(fontSize: 22,fontWeight: FontWeight.bold)),
          leading: Icon(Icons.menu )
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: SingleChildScrollView( 
            scrollDirection: Axis.horizontal,            child:DataTable(
              headingRowColor: WidgetStateProperty.all(Colors.red[900]),              columns: [
     DataColumn(label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
     DataColumn(label: Text('Title', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
      DataColumn(label: Text('Description', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
     DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
     DataColumn(label: Text('Done', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
     DataColumn(label: Text('Delete', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
            ],
            rows: _todos.map((todo) {
              return DataRow(
                cells: [
                  DataCell(Text(todo['id'].toString())),
                  DataCell(Text(todo['title'])),
                  DataCell(Text(todo['description'])),
                  DataCell(Text(todo['date'])),
                  DataCell(Text(todo['done'] == true ? '✔️' : '✖️')),
DataCell(TextButton(onPressed:(){
  
    deleteNote(todo["id"]);

},child: Text("Delete") )),
                ],
              );
            }).toList(), // <-- Added .toList() here
          ),
        )
        ),
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit, color: Colors.red.shade900),
        ),
      ),
    );
  }
}
