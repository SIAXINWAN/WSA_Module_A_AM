import 'package:flutter/material.dart';
import 'package:module_a_am/modal/economyItem.dart';

class EconomyDetailPage extends StatefulWidget {
  const EconomyDetailPage({super.key, required this.item});
  final EconomyItem item;

  @override
  State<EconomyDetailPage> createState() => _EconomyDetailPageState();
}

class _EconomyDetailPageState extends State<EconomyDetailPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> keyFigures = [
      {"title": "GDP", "value": "\$${widget.item.gdpUsdBn}B"},
      {"title": "Growth", "value": "${widget.item.growthPct}%"},
      {
        "title": "Trade Balance",
        "value":
            "${widget.item.tradeBalanceUsdBn >= 0 ? '+' : ''}\$${widget.item.tradeBalanceUsdBn}B"
      },
      {"title": "Inflation", "value": ""},
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Country Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 43, 70, 142),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    widget.item.flag,
                    width: 150,
                    height: 80,
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Text(
                      widget.item.country,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 43, 112, 193),
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 10),
              const Text(
                "Key Figures",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: keyFigures.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  final item = keyFigures[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item['title']!,
                                style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 8),
                            Text(item['value']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Economic Chart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
