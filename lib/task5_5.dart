import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FadeRoute extends PageRouteBuilder<void> {
  FadeRoute(Widget page)
      : super(
          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    ),
    home: const HomeScreen(),
  ));
}

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
              child: const Text('Open with FadeRoute'),
              onPressed: () => Navigator.push(
                  context, FadeRoute(const DetailsScreen('Custom FadeRoute'))),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              child: const Text('Open with normal push (theme transition)'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const DetailsScreen('Theme transition (Cupertino)'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String text;
  const DetailsScreen(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(child: Text(text)),
    );
  }
}