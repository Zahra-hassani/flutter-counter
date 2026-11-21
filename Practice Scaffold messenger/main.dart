import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

// 1. Separate MaterialApp so GreetUser's context is below ScaffoldMessenger
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GreetUser(),
    );
  }
}

class GreetUser extends StatefulWidget {
  const GreetUser({super.key});

  @override
  State<GreetUser> createState() => _GreetUserState();
}

class _GreetUserState extends State<GreetUser> {
  // 2. Removed 'final' so userName can be updated
  String userName = "";
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose(); // Clean up controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello, what is your name?",
                style: GoogleFonts.ubuntu(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "YOUR NAME",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  // 3. Added focusedBorder so it stays purple when typing
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.purple, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (_nameController.text.isNotEmpty) {
                    setState(() {
                      userName = _nameController.text;
                    });
                    // 4. Show SnackBar outside setState()
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Hi $userName",
                          style: GoogleFonts.lobsterTwo(
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    );
                  }
                },
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
