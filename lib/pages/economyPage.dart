import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:module_a_am/modal/economyItem.dart';
import 'package:module_a_am/pages/economyDetailPage.dart';

class EconomyPage extends StatefulWidget {
  const EconomyPage({super.key});

  @override
  State<EconomyPage> createState() => _EconomyPageState();
}

class _EconomyPageState extends State<EconomyPage> {
  List<EconomyItem> economyList = [];
  bool isAscending = true;
  String sortField = "country";

  @override
  void initState() {
    super.initState();
    loadEconomyData();
  }

  Future<void> loadEconomyData() async {
    final jsonString =
        await rootBundle.loadString('lib/assets/data/economy.json');
    final data = json.decode(jsonString);
    final List items = data['rows'];

    setState(() {
      economyList = items.map((item) => EconomyItem.fromJson(item)).toList();
      _sortList(sortField);
    });
  }

  void _sortList(String field) {
    setState(() {
      if (field == sortField) isAscending = !isAscending;
      sortField = field;

      economyList.sort((a, b) {
        dynamic valueA;
        dynamic valueB;

        switch (field) {
          case 'country':
            valueA = a.country;
            valueB = b.country;
            break;
          case 'gdp':
            valueA = a.gdpUsdBn;
            valueB = b.gdpUsdBn;
            break;
          case 'growth':
            valueA = a.growthPct;
            valueB = b.growthPct;
            break;
          case 'trade':
            valueA = a.tradeBalanceUsdBn;
            valueB = b.tradeBalanceUsdBn;
            break;
        }

        return isAscending
            ? Comparable.compare(valueA, valueB)
            : Comparable.compare(valueB, valueA);
      });
    });
  }

  Widget _buildHeader() {
    TextStyle headerStyle = const TextStyle(
        fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black87);

    return Card(
      color: Colors.blueGrey.shade50,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            const SizedBox(width: 40),
            Expanded(
                flex: 3,
                child: InkWell(
                    onTap: () => _sortList('country'),
                    child: Text('Country', style: headerStyle))),
            Expanded(
                flex: 2,
                child: InkWell(
                    onTap: () => _sortList('gdp'),
                    child: Center(
                        child: Text(
                            textAlign: TextAlign.center,
                            'GDP\n (USD bn)',
                            style: headerStyle)))),
            Expanded(
                flex: 2,
                child: InkWell(
                    onTap: () => _sortList('growth'),
                    child: Text(
                        textAlign: TextAlign.center,
                        'Growth (%)',
                        style: headerStyle))),
            Expanded(
                flex: 3,
                child: InkWell(
                    onTap: () => _sortList('trade'),
                    child: Text(
                        textAlign: TextAlign.center,
                        'Trade\n Balance \n(USD)',
                        style: headerStyle))),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(EconomyItem item) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => EconomyDetailPage(item: item)));
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image.asset(item.flag, width: 40, height: 40),
              const SizedBox(width: 8),
              Expanded(flex: 3, child: Text(item.country)),
              Expanded(
                  flex: 2,
                  child: Text(
                    item.gdpUsdBn.toStringAsFixed(0),
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    item.growthPct.toStringAsFixed(1),
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    item.tradeBalanceUsdBn.toStringAsFixed(1),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: const Text(
          textAlign: TextAlign.center,
          "ASEAN Member States \nEconomic Snapshot (2025)",
          style: TextStyle(fontSize: 20),
        ),
      )),
      body: economyList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: ListView.builder(
                    itemCount: economyList.length,
                    itemBuilder: (context, index) {
                      final item = economyList[index];
                      return _buildListItem(item);
                    },
                  ),
                )
              ],
            ),
    );
  }
}
