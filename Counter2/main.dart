import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: const CounterPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.blue,
                          foregroundColor: Colors.white           ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<CounterPage> createState() => _Counter();
}

class _Counter extends State<CounterPage> {
  int counter = 0;
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Counter"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                counter--;
              });
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
      body: Center(child: Text("$counter",style : TextStyle(fontSize: 30))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
