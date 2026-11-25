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
  TextEditingController search = TextEditingController();
  String searchQuery = "";

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

  void deleteNote(int id) {
    setState(() {
      notes.removeWhere((x) => x["id"] == id);
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
    });
  }

  void updateNote(int id, String title, String description) {
    setState(() {
      final index = notes.indexWhere((x) => x["id"] == id);
      if (index != -1) {
        notes[index] = {
          ...notes[index],
          "title": title,
          "description": description,
        };
      }
    });
  }

  void searchNote(String searchText) {
    setState(() {
      searchQuery = searchText.trim().toLowerCase();
    });
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayedNotes = searchQuery.isEmpty
        ? notes
        : notes
            .where((note) => (note["title"] as String)
                .toLowerCase()
                .contains(searchQuery))
            .toList();

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
            padding: const EdgeInsets.all(10.0),
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      hintText: "Note Title",
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    searchNote(search.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 16),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  child: const Text("Search"),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedNotes.length,
              itemBuilder: (context, index) {
                final currentNote = displayedNotes[index];
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

                        if (result != null) {
                          if (result["action"] == "delete") {
                            deleteNote(result["id"] as int);
                          } else if (result["action"] == "update") {
                            updateNote(
                              result["id"] as int,
                              result["title"] as String,
                              result["description"] as String,
                            );
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
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
  final Map<String, dynamic>? existingNote;

  const AddNote({super.key, this.existingNote});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  bool get isEditing => widget.existingNote != null;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
      text: widget.existingNote?['title'] ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.existingNote?['description'] ?? '',
    );
  }

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
          isEditing ? "Update Note" : "Add Note",
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
                      child: Text(isEditing ? "Update" : "Submit"),
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
              const SizedBox(height: 8),
              Text(note["description"]),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 7, right: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 6,
                  children: [
                    IconButton(
                      tooltip: "Edit",
                      onPressed: () async {
                        final updatedData =
                            await Navigator.push<Map<String, String>>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNote(existingNote: note),
                          ),
                        );

                        if (updatedData != null && context.mounted) {
                          Navigator.pop(context, {
                            "action": "update",
                            "id": note["id"],
                            "title": updatedData["title"],
                            "description": updatedData["description"],
                          });
                        }
                      },
                      icon: const Icon(Icons.edit, color: Colors.orange),
                    ),
                    IconButton(
                      tooltip: "Delete",
                      onPressed: () {
                        Navigator.pop(context, {
                          "action": "delete",
                          "id": note["id"],
                        });
                      },
                      icon: const Icon(Icons.delete, color: Colors.grey),
                    ),
                    IconButton(
                      tooltip: "Share",
                      onPressed: () {},
                      icon: const Icon(Icons.share, color: Colors.grey),
                    ),
                    IconButton(
                      tooltip: "Home",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.home, color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
