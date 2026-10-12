import 'package:flutter/material.dart';

class AppRoutes {
  static const home = '/';
  static const profile = '/profile';
  static const messages = '/messages';
  static const about = '/about';
}

void main() {
  runApp(MaterialApp(
    initialRoute: AppRoutes.home,
    routes: {
      AppRoutes.home: (c) => const SectionScreen(title: 'Home'),
      AppRoutes.profile: (c) => const SectionScreen(title: 'Profile'),
      AppRoutes.messages: (c) => const SectionScreen(title: 'Messages'),
      AppRoutes.about: (c) => const SectionScreen(title: 'About'),
    },
  ));
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _go(BuildContext context, String route) {
    Navigator.pop(context); // close the drawer first
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Menu', style: TextStyle(fontSize: 24))),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => _go(context, AppRoutes.home),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => _go(context, AppRoutes.profile),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Messages'),
            onTap: () => _go(context, AppRoutes.messages),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () => _go(context, AppRoutes.about),
          ),
        ],
      ),
    );
  }
}

class SectionScreen extends StatelessWidget {
  final String title;
  const SectionScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: const AppDrawer(),
      body: Center(child: Text('$title section', style: const TextStyle(fontSize: 22))),
    );
  }
}