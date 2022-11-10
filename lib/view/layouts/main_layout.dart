import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/theme.dart';
import '../pages/about_us.dart';
import '../pages/contact_us.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Consumer<ThemeModel>(
              builder: (context, themeModel, child) => IconButton(
                icon: themeModel.isDark
                    ? const Icon(Icons.mode_night)
                    : const Icon(Icons.sunny),
                onPressed: () => themeModel.switchTheme(),
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.info),
              ),
              Tab(
                icon: Icon(Icons.contact_mail),
              ),
            ],
          ),
          title: const Text('Site vitrine'),
        ),
        body: const TabBarView(
          children: [
            AboutUsPage(),
            ContactUsPage(),
          ],
        ),
      ),
    );
  }
}
