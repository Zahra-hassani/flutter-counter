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
  final TextEditingController search = TextEditingController();

  final List<Map<String, dynamic>> notes = [
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

  List<Map<String, dynamic>> filteredNotes = [];

  @override
  void initState() {
    super.initState();
    filteredNotes = List.from(notes);
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  void deleteNote(int id) {
    setState(() {
      notes.removeWhere((x) => x["id"] == id);
      _applySearchFilter(search.text);
    });
  }

  void addNewNote(String title, String description) {
    setState(() {
      final DateTime now = DateTime.now();
      final DateTime todayDate = DateTime(now.year, now.month, now.day);
      final nextId = notes.isEmpty ? 1 : (notes.last["id"] as int) + 1;
      notes.add({
        "id": nextId,
        "title": title,
        "description": description,
        "date": todayDate,
        "done": false,
      });
      _applySearchFilter(search.text);
    });
  }

  void _applySearchFilter(String searchText) {
    if (searchText.trim().isEmpty) {
      filteredNotes = List.from(notes);
    } else {
      filteredNotes = notes
          .where((x) => x["title"]
              .toString()
              .toLowerCase()
              .contains(searchText.trim().toLowerCase()))
          .toList();
    }
  }

  void searchNote(String searchText) {
    setState(() {
      _applySearchFilter(searchText);
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 12, 10, 4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: search,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        searchNote("");
                      }
                    },
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      hintText: "Note Title",
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      searchNote(search.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade700,
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                    ),
                    child: const Text("Search"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNotes.length,
              itemBuilder: (context, index) {
                final currentNote = filteredNotes[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () async {
                        final result =
                            await Navigator.push<Map<String, dynamic>>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoteDetails(currentNote),
                          ),
                        );

                        if (result != null && result.containsKey("id")) {
                          deleteNote(result["id"] as int);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.15),
                              offset: const Offset(0, 2),
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentNote["title"],
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              (currentNote["date"] as DateTime)
                                  .toIso8601String()
                                  .split('T')
                                  .first,
                              style: TextStyle(color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.grey.shade300, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
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
hintText: "Title",
hintStyle: TextStyle(color: Colors.grey),
errorBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.redAccent),
),
),
validator: (value) {
if (value == null || value.isEmpty) {
return "Title is required";
}
if (value.length < 3) {
return "Title field must be at least 3 chars";
}
return null;
},
),
TextFormField(
controller: _descriptionController,
decoration: const InputDecoration(
border: OutlineInputBorder(),
hintText: "Description",
hintStyle: TextStyle(color: Colors.grey),
errorBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.redAccent),
),
),
maxLines: 5,
validator: (value) {
if (value == null || value.isEmpty) {
return "Description is required";
}
if (value.length < 5) {
return "Description field must be at least 5 chars";
}
return null;
},
),
ElevatedButton(
style: ElevatedButton.styleFrom(
backgroundColor: Colors.orange.shade700,
foregroundColor: Colors.white,
),
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
),
);
}
} 
class NoteDetails extends StatelessWidget {
final Map<String, dynamic> note;
const NoteDetails(this.note, {super.key});
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
backgroundColor: Colors.orange.shade700,
foregroundColor: Colors.white,
title: Text(note["title"], style: const TextStyle(fontSize: 22)),
),
body: Container(
padding: const EdgeInsets.all(12),
margin: const EdgeInsets.all(12),
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(12),
gradient: LinearGradient(colors: [Colors.white, Colors.grey.shade300]),
boxShadow: const [
BoxShadow(
color: Colors.grey,
offset: Offset(0, 1),
blurRadius: 2,
spreadRadius: 1,
)
],
),
child: SingleChildScrollView(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
note["title"],
style:
const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
),
const SizedBox(height: 6),
Text(note["description"]),
const Divider(),
Padding(
padding: const EdgeInsets.only(top: 7, left: 7, right: 7),
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
spacing: 6,
children: [
IconButton(
onPressed: () {
Navigator.pop(context, {"id": note["id"]});
},
icon: const Icon(Icons.delete, color: Colors.grey),
),
IconButton(
onPressed: () {},
icon: const Icon(Icons.share, color: Colors.grey),
),
IconButton(
onPressed: () {
Navigator.pop(context);
},
icon: const Icon(Icons.home, color: Colors.grey),
),
],
),
),
],
),
),
),
);
}
}
