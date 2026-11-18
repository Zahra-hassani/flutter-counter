import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NoteApp(),
  ));
}

class NoteApp extends StatefulWidget {
  const NoteApp({super.key});

  @override
  State<NoteApp> createState() => _NoteAppState();
}
class _NoteAppState extends State<NoteApp> {
  final List<Map<String, dynamic>> _notes = [
    {
      "id": 1,
      "title": "Home Chores",
      "description": "Dish washing, sweeping the floor & Cooking until 9:30 AM",
      "date": DateTime(2026, 11, 16),
      "done": true
    },
    {
      "id": 2,
      "title": "Practice the Lessons",
      "description": "Doing Homework, reading my lessons and praying until 12:30 AM",
      "date": DateTime(2026, 11, 16),
      "done": true
    },
    {
      "id": 3,
      "title": "Go to Academy",
      "description": "Go and come back to home until 3:00 PM",
      "date": DateTime(2026, 11, 16),
      "done": true
    },
    {
      "id": 4,
      "title": "Meet Sara in Brand Coffeeshop",
      "description": "Meet her at 4:00 PM",
      "date": DateTime(2026, 11, 16),
      "done": false
    },
  ];

  void deleteNote(int id) {
    setState(() {
      _notes.removeWhere((x) => x["id"] == id);
    });
  }

  void addNewNote(String title, String description) {
    setState(() {
      final DateTime _now = DateTime.now();
      final DateTime todayDate = DateTime(_now.year, _now.month, _now.day);
      final nextId = _notes.isEmpty ? 1 : (_notes.last["id"] as int) + 1;
      _notes.add({
        "id": nextId,
        "title": title,
        "description": description,
        "date": todayDate,
        "done": false,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
        title: Text(
          "Note App",
          style: GoogleFonts.pacifico(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.menu),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index){
         return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        child: Material(
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap:(){},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0,2),
                    spreadRadius: 1,
                  )
                ],
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_notes[index]["title"], style: TextStyle(fontSize:19, fontWeight: FontWeight.w700)),
                  Text((_notes[index]["date"] as DateTime).toIso8601String()  ,style: TextStyle(color: Colors.grey.shade300)),
                ]
              )
            )
          )
        )
      )
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange.shade700,
        onPressed: () async {
          final result = await Navigator.push<Map<String, String>>(
            context,
            MaterialPageRoute(builder: (context) => const AddNote()),
          );
          if (result != null) {
            addNewNote(result['title']!, result['description']!);
          }
        },
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
}

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
        title: Text(
          "Add Note",
          style: GoogleFonts.pacifico(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[Colors.grey.shade300,Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10, offset: const Offset(0, 0),
              spreadRadius: 12,
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(11),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: _formKey,
              child: Column(
                spacing: 8,
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Title",
                      hintStyle: TextStyle(color: Colors.grey ),
                   errorBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.redAccent) )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Title is required";
                      }
                      if(value.length < 3){
                        return "Title field must be at least 3 chars"
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    hintText: "Description",
                    hintStyle: TextStyle(color: Colors.grey ),
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.redAccent)),
                 ),
                maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Description is required";
                      }
                      if(value.length < 5){
                        return "Description field must be at least 5 chars";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700 , 
                    foregroundColor: Colors.white),                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context, {
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                        });
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
