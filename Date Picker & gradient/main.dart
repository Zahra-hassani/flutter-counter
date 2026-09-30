import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: DatePicker()),
  );
}

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _GetDate();
}

class _GetDate extends State<DatePicker> {
  // Note: Since current year is 2026, make sure your initialDate falls
  // between your firstDate (1998) and lastDate (2027) constraints.
  DateTime selectedDate = DateTime(2025);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1998),
      lastDate: DateTime(2027), // Extended to 2027 to avoid constraint crashes
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Date Picker",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.cyan,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Colors.cyan.shade800,
              Colors.blue.shade200,
              Colors.pink.shade100,
            ],
          ),
        ),
        child: Center(
          // CHANGED: Replaced ListView with Column and set MainAxisSize.min
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Date: ${selectedDate.toLocal()}".split(' ')[0],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ), // Adds clean spacing between text and button
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text(
                  "Pick a Date",
                  style: TextStyle(color: Colors.cyan),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
