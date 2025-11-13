import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:module_a_am/modal/historyItem.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<HistoryItem> historyList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHistoryData();
  }

  Future<void> loadHistoryData() async {
    final jsonString =
        await rootBundle.loadString('lib/assets/data/history.json');
    final data = json.decode(jsonString);
    final List timeline = data['timeline'];

    setState(() {
      historyList = timeline.map((item) => HistoryItem.fromJson(item)).toList();
    });
  }

  Widget buildListItem(HistoryItem item) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${item.title} (${item.year}): ",
            style: TextStyle(
              color: const Color.fromARGB(255, 43, 112, 193),
              fontSize: 20,
            ),
          ),
          Text(
            item.host,
            style: TextStyle(
                color: const Color.fromARGB(255, 120, 120, 120), fontSize: 18),
          ),
          Text(item.description),
          Divider()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: historyList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: historyList.length,
                        itemBuilder: (context, index) {
                          final item = historyList[index];
                          return buildListItem(item);
                        }))
              ],
            ),
    );
  }
}
