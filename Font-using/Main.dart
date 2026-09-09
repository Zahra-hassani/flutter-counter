import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // 1. Using Google Fonts to fix the compile error

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      // Forces everything into Right-to-Left (RTL) mode automatically
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },

      // 2. Set the global default font theme using Google Fonts
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.teal,
        textTheme: GoogleFonts.vazirmatnTextTheme(), // Applies Vazirmatn globally
      ),

      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('فونت پیش‌فرض سیستم'), // Inherits the font automatically
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'تست بدون خطا در دارت‌پد',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'این نمونه کد در محیط دارت‌پد اجرا می‌شود و کل پروژه را به صورت یکپارچه با فونت زیبا و خوانای وزیر‌متن نمایش می‌دهد. اعداد فارسی: ۱۲۳۴۵۶',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
