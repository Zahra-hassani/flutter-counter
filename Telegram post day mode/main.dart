import 'package:flutter/material.dart';

void main() {
  runApp(const TelegramApp());
}

class TelegramApp extends StatelessWidget {
  const TelegramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(foregroundColor: Colors.white)),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) {
        if (settings.name == "/telegram") {
          return MaterialPageRoute(builder: (context) => const ChannelScreen());
        }
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade800,
        leading: const Icon(Icons.more_vert),
        title: Text(
          "بیتا",
          style: TextStyle(
            color: Colors.yellow.shade700,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Card(
          color: Colors.deepPurple[900],
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "فاضل نظری شاعر جوانی است که خوانندگان اشعار او را پسندیده و ابیات زیادی از او بر سر زبان‌هاست. او پیچیدگی را از شعرهایش دور نگه می‌دارد و شعرهای ساده و قابل‌فهمش نیازی به شرح و بسط اضافی ندارند. فاضل نظری مضامین و مفاهیم را به‌راحتی در قالبی موزون جای می‌دهد و خواننده را پابه‌پای خود تا انتهای سروده با خود می‌آورد. عنصر بارز شعرهای او را می‌توان احساس دانست. هرچند مفاهیم دیگر نیز به همان استواری در سروده‌هایش به چشم می‌آیند.",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChannelScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "کانال تلگرام استاد فاضل نظری",
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChannelScreen extends StatelessWidget {
  final bool isMe;
  const ChannelScreen({super.key, this.isMe = false});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: const Icon(Icons.arrow_back),
        title: const ListTile(
          leading: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://pbs.twimg.com/profile_images/1326776035535360000/Q7cWVCxw_400x400.jpg",
            ),
          ),
          title: Text(
            "استاد فاضل نظری",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
          ),
          subtitle: Text("9.1K subscribers", style: TextStyle(fontSize: 11)),
        ),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE5EEF9), Color(0xFFB9D4F1)],
            stops: [0.0, 1.0],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Card(
              elevation: 1,
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              color: isMe ? const Color(0xFF2B5278) : const Color(0xFFffffff),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: Radius.circular(isMe ? 12 : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 12),
                ),
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPq2_3ghtmt54qM2d5E98TB7NSdhDoJUlNIbS3paeYPLJVq06uSWuAnFi_&s=10",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "استاد فاضل نظری",
                            style: TextStyle(
                              color: Colors.red.shade300,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "به خواب ظلمت آلودیم شب های زلالی را",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "دریغا ما ندانستیم قدر آن لیالی را!",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "به جای شمعدانی های سرشار از شکوفایی",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "کنار یکدگر چیدیم گلدان های خالی را",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "مزار از دشت می سازند و تابوت از صنوبر ها",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "خدایا کی به پایان می بریم این مرگ سالی را!",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "کسی با نغمه الله اکبر بر نمی خیزد",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "موذن بی سبب آشفت خواب این اهالی را",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "جهان پیوسته تا کی بر مدار ظلم می گردد",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "مگر بر هم بریزد رادمردی این توالی را",
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "# فاضل_نظری /@ashoomteam",
                            style: TextStyle(fontSize: 17, color: Colors.blue),
                          ),
                        ),
                        Row(
                          spacing: 6,
                          children: [
                            const Chip(avatar: Text("🌟"), label: Text("0")),
                            Chip(
                              avatar: const Text("❤️"),
                              label: const Text(
                                "24",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            Chip(
                              avatar: const Text("👌"),
                              label: const Text(
                                "7",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                            Chip(
                              avatar: const Text("👍"),
                              label: const Text(
                                "4",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
