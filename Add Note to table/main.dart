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
  final List<Map<String, dynamic>> _todos = [
    {
      "id": 1,
      "title": "Home Chores",
      "description": "Dish washing, sweeping the floor & Cooking until 9:30 AM",
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

  void deleteNote(int id) {
    setState(() {
      _todos.removeWhere((x) => x["id"] == id);
    });
  }

  void addNewNote(String title, String description) {
    setState(() {
      final nextId = _todos.isEmpty ? 1 : (_todos.last["id"] as int) + 1;
      _todos.add({
        "id": nextId,
        "title": title,
        "description": description,
        "date": "11/17/2026",
        "done": false,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
        title: Text(
          "Note App",
          style: GoogleFonts.pacifico(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.menu),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(Colors.red[900]),
            columns: const [
              DataColumn(label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
              DataColumn(label: Text('Title', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
              DataColumn(label: Text('Description', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
              DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
              DataColumn(label: Text('Done', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
              DataColumn(label: Text('Delete', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
            ],
            rows: _todos.map((todo) {
              return DataRow(
                cells: [
                  DataCell(Text(todo['id'].toString())),
                  DataCell(Text(todo['title'])),
                  DataCell(Text(todo['description'])),
                  DataCell(Text(todo['date'])),
                  DataCell(Text(todo['done'] == true ? '✔️' : '✖️')),
                  DataCell(
                    TextButton(
                      onPressed: () => deleteNote(todo["id"]),
                      child: const Text("Delete"),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red.shade900,
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
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
        title: Text(
          "Add Note",
          style: GoogleFonts.pacifico(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, 0),
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
                      border: OutlineInputBorder(),
                      labelText: "Title",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Title is required";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Description",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Description is required";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
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
        ),
      ),
    );
  }
}
