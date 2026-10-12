import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HomeScreen()));

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _value = 0;

  Future<void> _edit() async {
    final result = await Navigator.push<int>(
      context,
      MaterialPageRoute(builder: (context) => EditorScreen(initial: _value)),
    );
    if (!mounted) return;
    // Back arrow => result is null => keep the old value.
    if (result != null) {
      setState(() => _value = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Value: $_value', style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _edit, child: const Text('Edit')),
          ],
        ),
      ),
    );
  }
}

class EditorScreen extends StatefulWidget {
  final int initial;
  const EditorScreen({super.key, required this.initial});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late int _current;

  @override
  void initState() {
    super.initState();
    _current = widget.initial; // work on a copy
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editor')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$_current', style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => setState(() => _current--),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => setState(() => _current++),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, _current),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}