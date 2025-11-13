import 'package:flutter/material.dart';
import 'package:module_a_am/pages/economyPage.dart';
import 'package:module_a_am/pages/historyPage.dart';
import 'package:module_a_am/pages/newsPage.dart';
import 'package:module_a_am/pages/settings.dart';

class TopTabBarPage extends StatefulWidget {
  const TopTabBarPage({super.key});

  @override
  State<TopTabBarPage> createState() => _TopTabBarPageState();
}

class _TopTabBarPageState extends State<TopTabBarPage> {
  void openSettingsDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const SettingsDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'lib/assets/bg2.png',
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'lib/assets/as logo.png',
                    width: 100,
                    height: 120,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 8,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      openSettingsDialog();
                    },
                    icon: const Icon(Icons.settings, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          bottom: const TabBar(
            indicatorWeight: 3.0,
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.normal, decoration: TextDecoration.none),
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Color.fromARGB(255, 255, 255, 255),
            labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
            unselectedLabelColor: Color.fromARGB(255, 231, 231, 231),
            tabs: [
              Tab(text: 'News'),
              Tab(text: 'Countries'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NewsPage(),
            EconomyPage(),
            HistoryPage(),
          ],
        ),
      ),
    );
  }
}
