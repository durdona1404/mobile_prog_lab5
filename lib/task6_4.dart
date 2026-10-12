import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SimpleScreen(title: 'Settings'),
    ),
    GoRoute(
      path: '/item/:id',
      name: 'item',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return SimpleScreen(title: 'Item #$id');
      },
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);

void main() => runApp(MaterialApp.router(routerConfig: router));

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('settings'),
              child: const Text('Settings'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () =>
                  context.goNamed('item', pathParameters: {'id': '42'}),
              child: const Text('Item 42'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.go('/does-not-exist'),
              child: const Text('Missing page'),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleScreen extends StatelessWidget {
  final String title;
  const SimpleScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed('home'),
          child: const Text('Back home'),
        ),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Page not found', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.goNamed('home'),
              child: const Text('Back home'),
            ),
          ],
        ),
      ),
    );
  }
}