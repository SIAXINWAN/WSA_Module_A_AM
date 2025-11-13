import 'package:flutter/material.dart';
import 'package:module_a_am/modal/newsItem.dart';

class NewsDetailPage extends StatefulWidget {
  final NewsItem newsItem;

  const NewsDetailPage({super.key, required this.newsItem});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "News",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 70, 142),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.asset(
                widget.newsItem.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            // 📰 Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    widget.newsItem.title,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 43, 113, 196)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.newsItem.summary,
                    style: const TextStyle(
                        fontSize: 16,
                        height: 1.4,
                        color: Color.fromARGB(255, 133, 132, 132)),
                  ),
                  ...widget.newsItem.content.map(
                    (paragraph) => Text(
                      paragraph,
                      style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Color.fromARGB(255, 133, 132, 132)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      icon: Icon(
                        size: 50,
                        isPressed ? Icons.thumb_up : Icons.thumb_up_off_alt,
                        color: isPressed ? Colors.blue : Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
