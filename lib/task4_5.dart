import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const HomeScreen(),
      '/rate': (context) => const RateScreen(),
    },
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const movie = 'Inception';
  String _text = 'Not rated yet';

  Future<void> _rate() async {
    final rating =
        await Navigator.pushNamed<int>(context, '/rate', arguments: movie);
    if (!mounted) return;
    if (rating != null) {
      setState(() => _text = '$movie: $rating/5');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_text, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _rate, child: const Text('Rate movie')),
          ],
        ),
      ),
    );
  }
}

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Rate $title')),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 1; i <= 5; i++)
              IconButton(
                icon: const Icon(Icons.star, color: Colors.amber, size: 36),
                onPressed: () => Navigator.pop(context, i),
              ),
          ],
        ),
      ),
    );
  }
}